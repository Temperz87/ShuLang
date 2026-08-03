#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <memory>
#include <optional>

using namespace sir;
using namespace std;

class FoldVisitor : public SIRVisitor {
    private:
        optional<shared_ptr<ValueNode>> lastValue = nullopt;

        void attempt_replace(shared_ptr<ValueNode>& node) {
            node->accept(this);
            if (lastValue.has_value()) {
                optional<int> oldVal = KnownConstant::GetIntValue(node.get());
                optional<int> newVal = KnownConstant::GetIntValue(lastValue.value().get());
                if (oldVal.has_value() && newVal.has_value() && oldVal.value() == newVal.value()) {
                    lastValue = nullopt;
                    return;
                }

                node = lastValue.value();
                lastValue = nullopt;
                did_work = true;
            }
        }

    public:
        bool did_work = false;
        FoldVisitor():lastValue(nullopt) { }

        void visit(ImmediateNode* node) override {
            lastValue = std::make_shared<ImmediateNode>(node->number, node->width);
        }

        void visit(SelectNode* node) override {
            auto cond = KnownConstant::GetIntValue(node->condition.get());
            if (cond.has_value()) {
                lastValue = cond.value()? node->true_value : node->false_value;
            }
        }

        void visit(AddNode* node) override {
            auto lhs = KnownConstant::GetIntValue(node->lhs.get());
            auto rhs = KnownConstant::GetIntValue(node->rhs.get());
            if (lhs.has_value() && rhs.has_value()) {
                int finalVal = lhs.value() + rhs.value();
                lastValue = make_shared<ImmediateNode>(finalVal, node->width);
            }
            else if (lhs.has_value() || rhs.has_value()) {
                int constant_value = (lhs.has_value())? lhs.value() : rhs.value();
                shared_ptr<ValueNode> nonconstant_value = (lhs.has_value())? node->rhs : node->lhs;
                if (constant_value == 0) {
                    lastValue = nonconstant_value;
                }
            }
        }

        void visit(SubNode* node) override {
            auto lhs = KnownConstant::GetIntValue(node->lhs.get());
            auto rhs = KnownConstant::GetIntValue(node->rhs.get());
            if (lhs.has_value() && rhs.has_value()) {
                int finalVal = lhs.value() - rhs.value();
                lastValue = make_shared<ImmediateNode>(finalVal, node->width);
            }
            else if (rhs.has_value() && rhs.value() == 0) {
                lastValue = node->lhs;
            }
        }

        void visit(MultNode* node) override {
            auto lhs = KnownConstant::GetIntValue(node->lhs.get());
            auto rhs = KnownConstant::GetIntValue(node->rhs.get());
            if (lhs.has_value() && rhs.has_value()) {
                int finalVal = lhs.value() * rhs.value();
                lastValue = make_shared<ImmediateNode>(finalVal, node->width);
            }
            else if (lhs.has_value() || rhs.has_value()) {
                int constant_value = (lhs.has_value())? lhs.value() : rhs.value();
                shared_ptr<ValueNode> nonconstant_value = (lhs.has_value())? node->rhs : node->lhs;
                if (constant_value == 0) {
                    lastValue = make_shared<ImmediateNode>(0, node->width);
                }
                else if (constant_value == 1) {
                    lastValue = nonconstant_value;
                }
            }
        }
        
        void visit(CmpNode* node) override {
            optional<int> lhs = KnownConstant::GetIntValue(node->lhs.get());
            optional<int> rhs = KnownConstant::GetIntValue(node->rhs.get());
            if (rhs.has_value() && lhs.has_value()) {
                int lhs_val = lhs.value();
                int rhs_val = rhs.value();
                int ret;
                if (node->op == "<") {
                    ret = lhs_val < rhs_val;
                } else if (node->op == "<=") {
                    ret = lhs_val <= rhs_val;
                } else if (node->op == "=") {
                    ret = lhs_val == rhs_val;
                } else if (node->op == "!=") {
                    ret = lhs_val != rhs_val;
                } else if (node->op == ">") {
                    ret = lhs_val > rhs_val;
                } else if (node->op == ">=") {
                    ret = lhs_val >= rhs_val;
                } else if (node->op == "and") {
                    ret = lhs_val && rhs_val;
                } else if (node->op == "or") {
                    ret = lhs_val || rhs_val;
                } else if (node->op == "xor") {
                    ret = lhs_val ^ rhs_val;
                } else {
                    lastValue = nullopt;
                    return;
                }

                lastValue = make_shared<ImmediateNode>(ret, node->width);
            }
            else if (lhs.has_value() || rhs.has_value()) {
                int constant = lhs.has_value()? lhs.value() : rhs.value();
                if (node->op == "and" && constant == 0) {
                    lastValue = make_shared<ImmediateNode>(0, node->width);
                }
                else if (node->op == "or" && constant == 1) {
                    lastValue = make_shared<ImmediateNode>(1, node->width);
                }
            }
        }
        
        void visit(DefinitionNode* node) override {
            attempt_replace(node->binding);
        }
        
        void visit(PhiNode* node) override {
            for (auto& candidate : node->candidates) {
                attempt_replace(candidate.second);
            }
        }
        
        void walk(SIRBlock* block) {
            for (std::shared_ptr<InstructionNode> instr : block->instructions) {
                instr->accept(this);
            }
        }
};

bool SIRFold(sir::FunctionDefinitionNode* function, AnalysisManager& am) {
    FoldVisitor visitor;
    for (shared_ptr<SIRBlock> block : function->blocks) {
        visitor.walk(block.get());
    }

    if (visitor.did_work) {
        am.invalidateFunction(function);
    }

    return visitor.did_work;
}
