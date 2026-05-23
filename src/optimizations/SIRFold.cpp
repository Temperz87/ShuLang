#include <Analysis.hpp>
#include <SIRAST.hpp>
#include <memory>
#include <optional>

using namespace sir;
using namespace std;

class FoldVisitor : public SIRVisitor {
    private:
        optional<shared_ptr<ValueNode>> lastValue;
        unordered_map<DefinitionNode*, int>& constantValues;

        void attempt_replace(shared_ptr<ValueNode>& node, optional<shared_ptr<ValueNode>>& out) {
            node->accept(this);
            out = lastValue;
            if (lastValue.has_value()) {
                node = lastValue.value();
                lastValue = nullopt;
            }
        }

        void attempt_replace(shared_ptr<ValueNode>& node) {
            optional<shared_ptr<ValueNode>> out;
            attempt_replace(node, out);
        }

    public:
        FoldVisitor(unordered_map<DefinitionNode*, int>& constantValues):lastValue(nullopt), 
           constantValues(constantValues) { }

        void visit(ReferenceNode* node) override {
            // Nothing to do here as propagation runs before this
            // So if we encounter a reference it is to a non constexpr value
            lastValue = nullopt;
        }

        void visit(SelectNode* node) override {
            optional<shared_ptr<ValueNode>> cond;
            attempt_replace(node->condition, cond);
            if (cond.has_value()) {
                optional<int> cond_true_false = KnownConstant::GetIntValue(cond.value().get());
                if (cond.has_value()) {
                    std::shared_ptr<ValueNode> target = cond_true_false.value()? node->true_value : node->false_value;
                    target->accept(this);
                    if (lastValue == nullopt) {
                        lastValue = target;
                    }
                }
            }
            else {
                attempt_replace(node->true_value);
                attempt_replace(node->false_value);
            }
        }

        void visit(AddNode* node) override {
            optional<shared_ptr<ValueNode>> lhs;
            optional<shared_ptr<ValueNode>> rhs;
            attempt_replace(node->lhs, lhs);
            attempt_replace(node->rhs, rhs);
            if (lhs.has_value() && rhs.has_value()) {
                optional<int> lhs_val = KnownConstant::GetIntValue(lhs.value().get());
                optional<int> rhs_val = KnownConstant::GetIntValue(rhs.value().get());
                if (lhs_val.has_value() && rhs_val.has_value()) {
                    int finalVal = lhs_val.value() + rhs_val.value();
                    lastValue = make_shared<ImmediateNode>(finalVal, node->width);
                }
            }
        }

        void visit(SubNode* node) override {
            optional<shared_ptr<ValueNode>> lhs;
            optional<shared_ptr<ValueNode>> rhs;
            attempt_replace(node->lhs, lhs);
            attempt_replace(node->rhs, rhs);
            if (lhs.has_value() && rhs.has_value()) {
                optional<int> lhs_val = KnownConstant::GetIntValue(lhs.value().get());
                optional<int> rhs_val = KnownConstant::GetIntValue(rhs.value().get());
                if (lhs_val.has_value() && rhs_val.has_value()) {
                    int finalVal = lhs_val.value() - rhs_val.value();
                    lastValue = make_shared<ImmediateNode>(finalVal, node->width);
                }
            }
        }

        void visit(MultNode* node) override {
            optional<shared_ptr<ValueNode>> lhs;
            optional<shared_ptr<ValueNode>> rhs;
            attempt_replace(node->lhs, lhs);
            attempt_replace(node->rhs, rhs);
            if (lhs.has_value() && rhs.has_value()) {
                optional<int> lhs_val = KnownConstant::GetIntValue(lhs.value().get());
                optional<int> rhs_val = KnownConstant::GetIntValue(rhs.value().get());
                if (lhs_val.has_value() && rhs_val.has_value()) {
                    int finalVal = lhs_val.value() * rhs_val.value();
                    lastValue = make_shared<ImmediateNode>(finalVal, node->width);
                }
            }
        }
        
        void visit(CmpNode* node) override {
            optional<shared_ptr<ValueNode>> lhs;
            optional<shared_ptr<ValueNode>> rhs;
            attempt_replace(node->lhs, lhs);
            attempt_replace(node->rhs, rhs);
            if (lhs.has_value() && rhs.has_value()) {
                optional<int> lhs_opt = KnownConstant::GetIntValue(lhs.value().get());
                optional<int> rhs_opt = KnownConstant::GetIntValue(rhs.value().get());
                if (lhs_opt.has_value() && rhs_opt.has_value()) {
                    int lhs_val = lhs_opt.value();
                    int rhs_val = rhs_opt.value();
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
            }
        }
        
        void visit(DefinitionNode* node) override {
            if (constantValues.contains(node)) {
                node->binding = make_shared<ImmediateNode>(constantValues[node], node->width);
            }
            else {
                attempt_replace(node->binding);
            }
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

void SIRFold(sir::ProgramNode& node, unordered_map<DefinitionNode*, int>& constants) {
    FoldVisitor visitor(constants);
    for (shared_ptr<SIRBlock> block : node.blocks) {
        visitor.walk(block.get());
    }
}
