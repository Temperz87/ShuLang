#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <optional>
#include <unordered_map>

using namespace sir;
using namespace std;

// TODO
//  When values can be things other than integers
//  According change this analysis!!!

class ConstantAnalysisVisitor : public SIRVisitor {
    private:
        optional<int> lastValue;
        SIRControlFlowGraph& cfg;
        SIRBlock* current;

    public:
        bool modified = false;
        unordered_map<DefinitionNode*, optional<int>> constantValues;
        ConstantAnalysisVisitor(SIRControlFlowGraph& cfg):cfg(cfg) { }

        void visit(ImmediateNode* node) override {
            lastValue = node->number;
        }

        void visit(ReferenceNode* node) override {
            auto lock = node->definition.lock();
            if (lock && constantValues.contains(lock.get())) {
                lastValue = constantValues[lock.get()];
            }
            else {
                lastValue = nullopt;
            }
        }

        void visit(SelectNode* node) override {
            node->condition->accept(this);
            if(lastValue.has_value()) {
                if (lastValue.value()) {
                    node->true_value->accept(this);
                }
                else {
                    node->false_value->accept(this);
                }
            }
            else {
                lastValue = nullopt;
            }
        }

        void visit(AddNode* node) override {
            node->lhs->accept(this);
            if (!lastValue.has_value()) {
                lastValue = nullopt;
                return;
            }

            int lhs = lastValue.value();
            node->rhs->accept(this);
            if (!lastValue.has_value()) {
                lastValue = nullopt;
                return;
            }

            // TODO: Width handling when we add 64 bit stuff
            lastValue = lhs + lastValue.value();
        }
        
        void visit(SubNode* node) override {
            node->lhs->accept(this);
            if (!lastValue.has_value()) {
                lastValue = nullopt;
                return;
            }

            int lhs = lastValue.value();
            node->rhs->accept(this);
            if (!lastValue.has_value()) {
                lastValue = nullopt;
                return;
            }

            // TODO: Width handling when we add 64 bit stuff
            lastValue = lhs - lastValue.value();
        }
        
        void visit(MultNode* node) override {
            node->lhs->accept(this);
            if (!lastValue.has_value()) {
                lastValue = nullopt;
                return;
            }

            int lhs = lastValue.value();
            node->rhs->accept(this);
            if (!lastValue.has_value()) {
                lastValue = nullopt;
                return;
            }

            // TODO: Width handling when we add 64 bit stuff
            lastValue = lhs * lastValue.value();
        }
        
        void visit(CmpNode* node) override {
            node->lhs->accept(this);
            if (!lastValue.has_value()) {
                lastValue = nullopt;
                return;
            }

            int lhs = lastValue.value();

            node->rhs->accept(this);
            if (!lastValue.has_value()) {
                lastValue = nullopt;
                return;
            }

            int rhs = lastValue.value();
            int ret;

            // No need for casting to bool
            // As results are guranteed to be 0 or 1
            //  In "and" "or" "xor" cases 
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
                lastValue = nullopt;
                return;
            }

            lastValue = ret;
        }
        
        void visit(DefinitionNode* node) override {
            node->binding->accept(this);
            bool contained = constantValues.contains(node);
            if (contained && lastValue != constantValues[node]) {
                // If the two values aren't equal, we have conflicting information
                // So we set the value to be top (nullopt) accordingly
                modified = constantValues[node] == nullopt;
                constantValues[node] = nullopt;
            }
            else {
                // Here the value is bottom (not yet visited)
                // Hence we just set it outright
                modified = !contained;
                constantValues[node] = lastValue;
            }
        }
        
        void visit(PhiNode* node) override {
            // If we haven't explored the first reachable candidate yet
            bool initial_value = false;
            optional<int> val = std::nullopt;
            for (int i = 0; i < node->candidates.size(); i++) {
                auto pair  = node->candidates[i];
                if (!initial_value) {
                    if (!cfg.unreachable_blocks.contains(pair.first)) {
                        pair.second->accept(this);
                        
                        // If we've explored a candidate and gotten no constnat value back
                        // Might as well stop now, as we know we aren't a constant
                        if (!lastValue.has_value()) {
                            return;
                        }

                        // Otherwise continue checking other reachable candidates
                        val = lastValue;
                        initial_value = true;
                    }

                    continue;
                }

                if (cfg.unreachable_blocks.contains(pair.first)) {
                    continue;
                }

                pair.second->accept(this);
                if (!lastValue.has_value() || lastValue != val) {
                    // We have two conflicting values
                    // Hence the Phi doesn't have a constant value
                    lastValue = nullopt;
                    return;
                }
            }

            lastValue = val;
        }
        
        void visit(PrintNode* node) override {
            lastValue = nullopt;
        }
        
        void visit(InputNode* node) override {
            lastValue = nullopt;
        }
        
        void visit(JumpIfElseNode* node) override {
            node->condition->accept(this);
            if (lastValue.has_value()) {
                if (lastValue.value()) {
                    cfg.remove_edge(current, node->else_destination.get());
                }
                else {
                    cfg.remove_edge(current, node->destination.get());
                }
            }
        }

        void walk(SIRBlock* block) {
            current  = block;
            for (std::shared_ptr<InstructionNode> instr : block->instructions) {
                instr->accept(this);
            }
        }
};

void join(unordered_map<DefinitionNode*, optional<int>>& res,
          const unordered_map<DefinitionNode*, optional<int>>& new_in) {
        for (auto pair : new_in) {
            DefinitionNode* def = pair.first;
            optional<int> value = pair.second;
            if (!res.contains(def)) {
                res[def] = value;
            }
            else if (res[def] != value) {
                res[def] = nullopt;
            }
        }
    }

unordered_map<DefinitionNode*, int> analyze_constants(SIRControlFlowGraph& cfg) {
    std::deque<SIRBlock*> queue;
    std::unordered_set<SIRBlock*> handling;
    std::deque<SIRBlock*> forwards;
    forwards.push_back(cfg.get_main());
    while (!forwards.empty()) {
        SIRBlock* curr = forwards.front();
        forwards.pop_front();
        queue.push_back(curr);
        handling.insert(curr);
        for (SIRBlock* block : cfg.get_outgoing(curr)) {
            if (!handling.contains(block))
                forwards.push_back(block);
        }
    } 

    // Dataflow analysis for constants
    // Visitor "walk" is our transfer function
    // Walk CFG in order
    // When we discover a new value for a constant
    //  E.g. "top", int 5
    //  Redo the outgoing blocks
    // Top is represented by nullopt
    // Bottom is represented by no value in map
    unordered_map<SIRBlock*, unordered_map<DefinitionNode*, optional<int>>> live_outs;
    ConstantAnalysisVisitor visitor(cfg);
    while (!queue.empty()) {
        SIRBlock* curr = queue.front();
        queue.pop_front();
        handling.erase(curr);

        // Join all inside dictionaries
        unordered_map<DefinitionNode*, optional<int>> live_in;
        for (SIRBlock* block : cfg.get_incoming(curr)) {
            if (!cfg.unreachable_blocks.contains(block) && live_outs.contains(block)) {
                join(live_in, live_outs[block]);
            }
        }

        visitor.constantValues = live_in;
        visitor.walk(curr);
        if (visitor.modified) {
            for (SIRBlock* block : cfg.get_outgoing(curr)) {
                if (!handling.contains(block)) {
                    handling.insert(block);
                    queue.push_back(block);
                }
            }

            live_outs[curr] = std::move(visitor.constantValues);
            visitor.modified = false;
        }
    }

    unordered_map<DefinitionNode*, int> results;
    for (auto pair : live_outs) {
        for (auto def_val : pair.second) {
            DefinitionNode* def = def_val.first;
            optional<int> val = def_val.second;
            if (val.has_value()) {
                results[def] = val.value();
            }
        }
    }
    
    return results;
}
