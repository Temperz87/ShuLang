#include <Analysis.hpp>
#include <SIRAST.hpp>

using namespace sir;
using namespace std;

class PropagationVisitor : public SIRVisitor {
    private:
        optional<int> lastValue = nullopt;
        unordered_map<DefinitionNode*, int>& constantValues;

        void attempt_replace(shared_ptr<ValueNode>& node) {
            lastValue = nullopt;
            node->accept(this);
            optional<int> oldVal = KnownConstant::GetIntValue(node.get());
            if (lastValue.has_value() &&
                (!oldVal.has_value() || oldVal.value() != lastValue.value())) {
                node = make_shared<ImmediateNode>(lastValue.value(), node->width);
                lastValue = nullopt;
                did_work = true;
            }
        }

    public:
        bool did_work = false;
        PropagationVisitor(unordered_map<DefinitionNode*, int>& constantValues):lastValue(nullopt), 
           constantValues(constantValues) { }

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

        void visit(CallNode* node) override {
            for (auto& argument : node->arguments) {
                attempt_replace(argument);
            }
        }

        void visit(ReturnNode* node) override {
            attempt_replace(node->return_value);
        }
        
        void walk(SIRBlock* block) {
            for (std::shared_ptr<InstructionNode> instr : block->instructions) {
                instr->accept(this);
            }
        }
};

bool SIRPropagate(sir::FunctionDefinitionNode* function, AnalysisManager& am) {
    PropagationVisitor visitor(am.getIPSCCPResults()->results[function]->constants);
    for (shared_ptr<SIRBlock> block : function->blocks) {
        visitor.walk(block.get());
    }

    if (visitor.did_work) {
        am.invalidateFunction(function);
    }

    return visitor.did_work;
}
