#include <Analysis.hpp>
#include <deque>
#include <memory>
#include <IPSCCP.hpp>
#include <SIRVisitor.hpp>
#include <SIRCallGraph.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <stdexcept>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace sir;
using namespace std;

ConstantLattice join(const ConstantLattice& lhs, const ConstantLattice& rhs) {
    if (lhs.type == TOP || rhs.type == TOP) {
        return {TOP,0 };
    }
    else if (lhs.type == CONSTANT && rhs.type == CONSTANT) {
        if (lhs.value == rhs.value) {
            return lhs;
        }
        else {
            return {TOP, 0};
        }
    }
    else {
        return (lhs.type == BOTTOM)? rhs : lhs;
    }
}

class IPSCCPVisitor : public SIRVisitor {
    private:
        ConstantLattice lastValue;
        deque<SIRBlock*> reachable_worklist;
        unordered_set<SIRBlock*> handling;
        deque<InstructionNode*> modified_instructions;
        unordered_set<InstructionNode*> handling_instructions;
        unordered_map<FunctionDefinitionNode*, FunctionSummary>& summaries;
        UseDefInfo* usedefs;
        unordered_set<FunctionDefinitionNode*> dirty_functions;
        SIRBlock* current_block;
        FunctionDefinitionNode* current_function;

        ConstantLattice get_value(ValueNode* val) {
            val->accept(this);
            return lastValue;
        };

        void mark_block_reachable(SIRBlock* from, SIRBlock* to) {
            if (reachable_blocks.contains(to) && reachable_edges[from].contains(to)) {
                return;
            }

            reachable_edges[from].insert(to);
            reachable_blocks.insert(to);
            if (!handling.contains(to)) {
                handling.insert(to);
                reachable_worklist.push_back(to);
            }
        }

        void visit_bin_op(ValueNode* lhs_node, ValueNode* rhs_node, auto F) {
            ConstantLattice lhs = get_value(lhs_node);
            ConstantLattice rhs = get_value(rhs_node);
            // TODO: Width handling when we add 64 bit stuff
            if (lhs.type != CONSTANT || rhs.type != CONSTANT) {
                LatticeType ty = lhs.type == TOP || rhs.type == TOP? TOP : BOTTOM;
                lastValue = {ty, 0};
            }
            else {
                int ret = F(lhs.value, rhs.value);
                lastValue = {CONSTANT, ret};
            }
        }

    public:
        unordered_map<DefinitionNode*, ConstantLattice> constantValues;
        std::unordered_map<SIRBlock*, std::unordered_set<SIRBlock*>> reachable_edges;
        unordered_set<SIRBlock*> reachable_blocks;
        IPSCCPVisitor(unordered_map<FunctionDefinitionNode*, FunctionSummary>& summaries,
                      UseDefInfo* usedefs, FunctionDefinitionNode* current_function)
            :summaries(summaries), usedefs(usedefs), current_function(current_function) { }

        void visit(ImmediateNode* node) override {
            lastValue = { CONSTANT, node->number};
        }

        void visit(ReferenceNode* node) override {
            auto lock = node->definition.lock();
            if (lock) {
                ConstantLattice val = constantValues.contains(lock.get())? constantValues[lock.get()] : ConstantLattice{BOTTOM, 0};
                lastValue = val;
            }
            else {
                // Shouldn't occur in practice
                lastValue = {BOTTOM, 0};
            }
        }

        void visit(SelectNode* node) override {
            node->condition->accept(this);
            if(lastValue.type == CONSTANT) {
                if (lastValue.value) {
                    node->true_value->accept(this);
                }
                else {
                    node->false_value->accept(this);
                }
            }
            else {
                ConstantLattice true_val = get_value(node->true_value.get());
                ConstantLattice false_val = get_value(node->false_value.get());
                lastValue = join(true_val, false_val); 
            }
        }

        void visit(AddNode* node) override {
            visit_bin_op(node->lhs.get(), node->rhs.get(), [](int x, int y){
                return x + y;
            });
        }
        
        void visit(SubNode* node) override {
            visit_bin_op(node->lhs.get(), node->rhs.get(), [](int x, int y){
                return x - y;
            });
        }
        
        void visit(MultNode* node) override {
            visit_bin_op(node->lhs.get(), node->rhs.get(), [](int x, int y){
                return x * y;
            });
        }
        
        void visit(CmpNode* node) override {
            visit_bin_op(node->lhs.get(), node->rhs.get(), [&](int lhs, int rhs){
                // No need for casting to bool 
                // As results are guranteed to be 0 or 1
                //  In "and" "or" "xor" cases 
                int ret;
                if (node->op == "<") {
                    ret = lhs < rhs;
                } else if (node->op == "<=") {
                    ret = lhs <= rhs;
                } else if (node->op == "=") {
                    ret = lhs == rhs;
                } else if (node->op == "!=") {
                    ret = lhs != rhs;
                } else if (node->op == ">") {
                    ret = lhs > rhs;
                } else if (node->op == ">=") {
                    ret = lhs >= rhs;
                } else if (node->op == "and") {
                    ret = lhs && rhs;
                } else if (node->op == "or") {
                    ret = lhs || rhs;
                } else if (node->op == "xor") {
                    ret = lhs ^ rhs;
                } else {
                    throw runtime_error("Got an invalid operator for a CmpNode");
                }
                
                return ret;
            });

        }
        
        void visit(DefinitionNode* node) override {
            node->binding->accept(this);
            ConstantLattice old = constantValues.contains(node)? constantValues[node]: ConstantLattice{BOTTOM, 0};
            ConstantLattice joined = join(old, lastValue); 
            bool modified = constantValues[node] != joined;
            constantValues[node] = joined;
            if (modified) {
                for (InstructionNode* values : usedefs->usedefs[node]) {
                    // If values is in the current block
                    if (!handling_instructions.contains(values)) {
                        modified_instructions.push_back(values);
                        handling_instructions.insert(values);
                    }
                }
            }
        }
        
        void visit(PhiNode* node) override {
            ConstantLattice val = {BOTTOM, 0};
            for (int i = 0; i < node->candidates.size(); i++) {
                auto pair  = node->candidates[i];
                if (reachable_blocks.contains(pair.first) && reachable_edges[pair.first].contains(current_block)) {
                    ConstantLattice incoming = get_value(pair.second.get());
                    val = join(val, incoming);
                }
            }

            lastValue = val;
        }
        
        void visit(PrintNode* node) override {
            lastValue = {TOP, 0};
        }
        
        void visit(InputNode* node) override {
            lastValue = {TOP, 0};
        }

        void visit(JumpNode* node) override {
            mark_block_reachable(current_block, node->destination.get());
        }
        
        void visit(JumpIfElseNode* node) override {
            node->condition->accept(this);
            if (lastValue.type == CONSTANT) {
                if (lastValue.value) {
                    mark_block_reachable(current_block, node->destination.get());
                }
                else {
                    mark_block_reachable(current_block, node->else_destination.get());
                }
            }
            else {
                mark_block_reachable(current_block, node->destination.get());
                mark_block_reachable(current_block, node->else_destination.get());
            }
        }

        void visit(ReturnNode* node) override {
            ConstantLattice current_return = summaries[current_function].return_value;
            ConstantLattice new_return = get_value(node->return_value.get());
            ConstantLattice joined = join(current_return, new_return);
            if (current_return != joined) {
                dirty_functions.insert(current_function);
                summaries[current_function].return_value = joined;
            }
        }
        
        void visit(CallNode* node) override {
            auto lock = node->function.lock();
            if (!lock) {
                return;
            }

            FunctionDefinitionNode* function = lock.get();
            if (lock) {
                FunctionSummary& summary = summaries[function];
                for (int i = 0; i < summary.parameter_values.size(); i++) {
                    ConstantLattice& old = summary.parameter_values[i];
                    ConstantLattice incoming = get_value(node->arguments[i].get()); 
                    ConstantLattice new_value = join(old, incoming);
                    if (new_value != old) {
                        dirty_functions.insert(function);
                        old = new_value;
                    }
                }

                lastValue = summaries[function].return_value;
            }
        }

        unique_ptr<SCCPResults> SCCP(const SIRControlFlowGraph* cfg) {
            // Enqueue parameter lattice
            for (int i = 0; i < current_function->parameters.size(); i++) {
                auto parameter = current_function->parameters[i];
                this->constantValues[parameter.get()] = summaries[current_function].parameter_values[i];
            }

            // Initialize worklists
            this->reachable_blocks.insert(cfg->get_entry());
            this->reachable_worklist.push_front(cfg->get_entry());
            while (!this->reachable_worklist.empty() || !this->modified_instructions.empty()) {
                // Walk through reachable blocks first
                //  Order shouldn't matter
                while (!this->reachable_worklist.empty()) {
                    this->current_block = this->reachable_worklist.front();
                    this->reachable_worklist.pop_front();
                    this->handling.erase(this->current_block);
                    for (shared_ptr<InstructionNode> instr : this->current_block->instructions) {
                        instr->accept(this);
                    }
                }

                // Then walk through modified instructions
                while (!this->modified_instructions.empty()) {
                    InstructionNode* instr = this->modified_instructions.front();
                    this->modified_instructions.pop_front();
                    this->handling_instructions.erase(instr);
                    if (!this->reachable_blocks.contains(instr->parent)) {
                        continue;
                    }

                    this->current_block = instr->parent;
                    instr->accept(this);
                }
            }

            // Bundle up constants before returning
            unordered_map<DefinitionNode*, int> ret;
            for (auto pair : this->constantValues) {
                if (pair.second.type == CONSTANT) {
                    ret[pair.first] = pair.second.value;
                }
            }

            return make_unique<SCCPResults>(ret, reachable_edges, reachable_blocks);
        }

        static void run_dirty_functions(AnalysisManager& am, 
                                        const vector<FunctionDefinitionNode*>& dirty_functions, 
                                        IPSCCPResults& results) {
            CallGraph* cg = am.getCallGraph();

            // Initialize worklist
            deque<FunctionDefinitionNode*> queue(dirty_functions.begin(), dirty_functions.end());
            unordered_set<FunctionDefinitionNode*> handling(dirty_functions.begin(), dirty_functions.end());
            
            // Iterate through functions
            while (!queue.empty()) {
                FunctionDefinitionNode* current = queue.front();
                queue.pop_front();
                handling.erase(current);

                // Perform SCCP
                SIRControlFlowGraph* cfg = am.getCFG(current);
                UseDefInfo* usedef = am.getUseDefChains(current);
                IPSCCPVisitor visitor(results.summaries, usedef, current);
                results.results[current] = visitor.SCCP(cfg);

                // Add functions whose IPSCCP results might be changed
                // e.g. main calls foo, foo calls bar
                //  foo has been changed, so enqueue main and bar
                for (FunctionDefinitionNode* dirty : visitor.dirty_functions) {
                    // First add self
                    if (!handling.contains(dirty)) {
                        queue.push_back(dirty);
                        handling.insert(dirty);
                    }

                    // Add callers
                    for (auto def : cg->get_incoming(dirty)) {
                        if (!handling.contains(def)) {
                            queue.push_back(def);
                            handling.insert(def);
                        }
                    }

                    // Add callees
                    for (auto def : cg->get_outgoing(dirty)) {
                        if (!handling.contains(def)) {
                            queue.push_back(def);
                            handling.insert(def);
                        }
                    }
                }
            }
        }
};

void sir::IPSCCP(AnalysisManager& am, const vector<FunctionDefinitionNode*>& dirty_functions, IPSCCPResults& results) {
    IPSCCPVisitor::run_dirty_functions(am, dirty_functions, results);
}
