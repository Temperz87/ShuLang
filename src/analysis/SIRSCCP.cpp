#include <Analysis.hpp>
#include <deque>
#include <memory>
#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <stdexcept>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace sir;
using namespace std;

enum LatticeType {
    BOTTOM,
    TOP,
    CONSTANT
};

// TODO
//  When values can be things other than integers
//  Change this analysis accordingly!!!
typedef struct ConstantLattice {
    LatticeType type;
    int value;

    ConstantLattice() {
        type = BOTTOM;
        value = 0;
    }

    ConstantLattice(LatticeType type, int value):type(type), value(value) { }
    auto operator<=>(const struct ConstantLattice&) const = default;


} ConstantLattice_t;

ConstantLattice_t join(const ConstantLattice_t& lhs, const ConstantLattice_t& rhs) {
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

class SCCPVisitor : public SIRVisitor {
    private:
        ConstantLattice_t lastValue;
        deque<SIRBlock*> reachable_worklist;
        unordered_set<SIRBlock*> handling;
        deque<InstructionNode*> modified_instructions;
        unordered_set<InstructionNode*> handling_instructions;
        SIRBlock* current_block;

        ConstantLattice_t get_value(ValueNode* val) {
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
            ConstantLattice_t lhs = get_value(lhs_node);
            ConstantLattice_t rhs = get_value(rhs_node);
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
        unordered_map<DefinitionNode*, ConstantLattice_t> constantValues;
        std::unordered_map<SIRBlock*, std::unordered_set<SIRBlock*>> reachable_edges;
        unordered_set<SIRBlock*> reachable_blocks;
        UseDefInfo& usedefs;
        SCCPVisitor(UseDefInfo& usedefs):usedefs(usedefs) { }

        void visit(ImmediateNode* node) override {
            lastValue = { CONSTANT, node->number};
        }

        void visit(ReferenceNode* node) override {
            auto lock = node->definition.lock();
            if (lock) {
                ConstantLattice_t val = constantValues.contains(lock.get())? constantValues[lock.get()] : ConstantLattice_t{BOTTOM, 0};
                lastValue = val;
            }
            else {
                // Shouldn't occur in practice
                lastValue = {TOP, 0};
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
                ConstantLattice_t true_val = get_value(node->true_value.get());
                ConstantLattice_t false_val = get_value(node->false_value.get());
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
            ConstantLattice_t old = constantValues.contains(node)? constantValues[node]: ConstantLattice_t{BOTTOM, 0};
            ConstantLattice_t joined = join(old, lastValue); 
            bool modified = constantValues[node] != joined;
            constantValues[node] = joined;
            if (modified) {
                for (InstructionNode* values : usedefs.usedefs[node]) {
                    // If values is in the current block
                    if (!handling_instructions.contains(values)) {
                        modified_instructions.push_back(values);
                        handling_instructions.insert(values);
                    }
                }
            }
        }
        
        void visit(PhiNode* node) override {
            ConstantLattice_t val = {BOTTOM, 0};
            for (int i = 0; i < node->candidates.size(); i++) {
                auto pair  = node->candidates[i];
                if (reachable_blocks.contains(pair.first) && reachable_edges[pair.first].contains(current_block)) {
                    ConstantLattice_t incoming = get_value(pair.second.get());
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
                    if (reachable_edges[current_block].contains(node->else_destination.get())) {
                        reachable_edges[current_block].erase(node->else_destination.get());
                    }
                }
                else {
                    mark_block_reachable(current_block, node->else_destination.get());
                    if (reachable_edges[current_block].contains(node->destination.get())) {
                        reachable_edges[current_block].erase(node->destination.get());
                    }
                }
            }
            else {
                mark_block_reachable(current_block, node->destination.get());
                mark_block_reachable(current_block, node->else_destination.get());
            }
        }
        
        void visit(CallNode* node) override {
            // This will always be top unless inlining
            lastValue = {TOP, 0};
        }

        static SCCPResults SCCP(const SIRControlFlowGraph& cfg, FunctionDefinitionNode* function,
                UseDefInfo& usedefs) {
            SCCPVisitor visitor(usedefs);
            // Assign all parameters the top value
            // As we don't reason about inter procedural stuff yet
            for (auto parameter : function->parameters) {
                visitor.constantValues[parameter.get()] = {TOP, 0};
            }

            visitor.reachable_blocks.insert(cfg.get_entry());
            visitor.reachable_worklist.push_front(cfg.get_entry());
            while (!visitor.reachable_worklist.empty() || !visitor.modified_instructions.empty()) {
                while (!visitor.reachable_worklist.empty()) {
                    visitor.current_block = visitor.reachable_worklist.front();
                    visitor.reachable_worklist.pop_front();
                    visitor.handling.erase(visitor.current_block);
                    for (shared_ptr<InstructionNode> instr : visitor.current_block->instructions) {
                        instr->accept(&visitor);
                    }
                }

                while (!visitor.modified_instructions.empty()) {
                    InstructionNode* instr = visitor.modified_instructions.front();
                    visitor.modified_instructions.pop_front();
                    visitor.handling_instructions.erase(instr);
                    if (!visitor.reachable_blocks.contains(instr->parent)) {
                        continue;
                    }

                    visitor.current_block = instr->parent;
                    instr->accept(&visitor);
                }
            }

            unordered_map<DefinitionNode*, int> ret;
            for (auto pair : visitor.constantValues) {
                if (pair.second.type == CONSTANT) {
                    ret[pair.first] = pair.second.value;
                }
            }

            return SCCPResults(ret, visitor.reachable_edges, visitor.reachable_blocks);
        }
};

SCCPResults SIRSCCP(const SIRControlFlowGraph& cfg, FunctionDefinitionNode* function, UseDefInfo& usedefs) {
    unordered_map<DefinitionNode*, int> ret;
    return SCCPVisitor::SCCP(cfg, function, usedefs);
}
