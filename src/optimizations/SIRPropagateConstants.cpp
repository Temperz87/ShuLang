#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <iostream>

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
            // If we have discovered a constant candidate and one of:
            //  1. The current value in the node is NOT a constant
            //      e.g. call, reference
            //  2. The current constant isn't the same as the one we found
            // We replace it!
            if (lastValue.has_value() &&
                (!oldVal.has_value() || oldVal.value() != lastValue.value())) {
                node = make_shared<ImmediateNode>(lastValue.value(), node->width);
                lastValue = nullopt;
            }
        }

    public:
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

void SIRPropagate(sir::FunctionDefinitionNode* function, AnalysisManager& am) {
    auto ipsccp_results = am.getIPSCCPResults();
    if (ipsccp_results->results[function] == nullptr) {
        std::cout << "ShuC: An error has occured while optimizing your code" << std::endl;
        std::cout << "\tPlease report \"SIRPropagate\" null SCCP results error" << std::endl;
        std::cout << "If you would like to compile your code without optimizations, pass the \"-O0\" flag" << std::endl;
    }

    PropagationVisitor visitor(ipsccp_results->results[function]->constants);
    for (shared_ptr<SIRBlock> block : function->blocks) {
        visitor.walk(block.get());
    }

}
