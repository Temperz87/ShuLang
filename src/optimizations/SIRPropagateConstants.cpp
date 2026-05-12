#include <SIRAST.hpp>

using namespace sir;
using namespace std;

class PropagationVisitor : SIRVisitor {
    private:
        optional<int> lastValue;
        unordered_map<DefinitionNode*, int>& constantValues;

        void attempt_replace(shared_ptr<ValueNode>& node) {
            node->accept(this);
            if (lastValue.has_value()) {
                node = make_shared<ImmediateNode>(lastValue.value(), node->width);
                lastValue = nullopt;
            }
        }

    public:

        PropagationVisitor(unordered_map<DefinitionNode*, int>& constantValues):lastValue(nullopt), 
           constantValues(constantValues) { }

        void visit(ReferenceNode* node) override {
            if (constantValues.contains(node->definition)) {
                lastValue = constantValues[node->definition];
            }
            else {
                lastValue = nullopt;
            }
        }

        void visit(SelectNode* node) override {
            attempt_replace(node->condition);
            attempt_replace(node->true_value);
            attempt_replace(node->false_value);
        }

        void visit(AddNode* node) override {
            attempt_replace(node->lhs);
            attempt_replace(node->rhs);
        }

        void visit(SubNode* node) override {
            attempt_replace(node->lhs);
            attempt_replace(node->rhs);
        }

        void visit(MultNode* node) override {
            attempt_replace(node->lhs);
            attempt_replace(node->rhs);
        }
        
        void visit(CmpNode* node) override {
            attempt_replace(node->lhs);
            attempt_replace(node->rhs);
        }
        
        void visit(DefinitionNode* node) override {
            node->binding->accept(this);
        }
        
        void visit(PhiNode* node) override {
            for (auto& candidate : node->candidates) {
                attempt_replace(candidate.second);
            }
        }
        
        void visit(PrintNode* node) override {
            attempt_replace(node->to_print);
        }

        void visit(JumpIfElseNode* node) override {
            attempt_replace(node->condition);
        }
        
        void walk(SIRBlock* block) {
            for (std::shared_ptr<InstructionNode> instr : block->instructions) {
                instr->accept(this);
            }
        }
};

void SIRPropagate(sir::ProgramNode& node, unordered_map<DefinitionNode*, int>& constants) {
    PropagationVisitor visitor(constants);
    for (shared_ptr<SIRBlock> block : node.blocks) {
        visitor.walk(block.get());
    }
}
