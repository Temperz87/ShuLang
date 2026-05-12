#include <SIRVisitor.hpp>
#include <SIRCFG.hpp>
#include <SIRAST.hpp>
#include <optional>
#include <unordered_map>

using namespace sir;
using namespace std;

// TODO
//  When values can be things other than integeres
//  According change this analysis!!!

class ConstantAnalysisVisitor : SIRVisitor {
    private:
        optional<int> lastValue;

    public:
        bool modified = false;
        unordered_map<DefinitionNode*, optional<int>> constantValues;

        void visit(ImmediateNode* node) {
            lastValue = node->number;
        }

        void visit(ReferenceNode* node) {
            if (constantValues.contains(node->definition)) {
                lastValue = constantValues[node->definition];
            }
            else {
                lastValue = nullopt;
            }
        }

        void visit(SelectNode* node) {
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

        void visit(AddNode* node) {
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
        
        void visit(SubNode* node) {
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
        
        void visit(MultNode* node) {
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
        
        void visit(CmpNode* node) {
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
        
        void visit(DefinitionNode* node) {
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
        
        void visit(PhiNode* node) {
            node->candidates[0].second->accept(this);
            if (!lastValue.has_value()) {
                lastValue = nullopt;
                return;
            }
            
            int val = lastValue.value();
            for (int i = 1; i < node->candidates.size(); i++) {
                auto pair  = node->candidates[i];
                pair.second->accept(this);
                if (!lastValue .has_value()|| lastValue != val) {
                    lastValue = nullopt;
                    return;
                }
            }

            lastValue = val;
        }
        
        void visit(PrintNode* node) {
            lastValue = nullopt;
        }
        
        void visit(InputNode* node) {
            lastValue = nullopt;
        }

        void walk(SIRBlock* block) {
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

unordered_map<DefinitionNode*, int> analyze_constants(const ProgramNode& program) {
    std::vector<SIRBlock*> blocks;
    for (std::shared_ptr<SIRBlock> block : program.blocks) {
        blocks.push_back(block.get());
    }

    std::deque<SIRBlock*> queue;
    std::unordered_set<SIRBlock*> handling;
    SIRControlFlowGraph cfg(blocks);
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
    ConstantAnalysisVisitor visitor;
    while (!queue.empty()) {
        SIRBlock* curr = queue.front();
        queue.pop_front();
        handling.erase(curr);

        // Join all inside dictionaries
        unordered_map<DefinitionNode*, optional<int>> live_in;
        for (SIRBlock* block : cfg.get_incoming(curr)) {
            if (live_outs.contains(block)) {
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
