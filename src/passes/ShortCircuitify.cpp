#include <ComplexDetector.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <cstddef>
#include <iostream>
#include <memory>
#include <unordered_map>

class TransformToShortCircuit : public ShuLangVisitor {
    private:

        std::unordered_map<ValueNode*, std::shared_ptr<ValueNode>> marks;
        std::unordered_map<ValueNode*, std::shared_ptr<ValueNode>> not_nodes;

        inline void replace_with_mark(std::shared_ptr<ValueNode>& node) {
            if (marks.contains(node.get())) {
                node = marks.at(node.get());
            };
        }

    public:
        void onEgressBindingNode(BindingNode* node) override {
            replace_with_mark(node->value);
        }

        void onEgressPrintNode(PrintNode* node) override {
            replace_with_mark(node->to_print);
        }
        
        void onEgressIfNode(IfNode* node) override { 
            if (not_nodes.contains(node->condition->end_value.get()) && node->else_block != nullptr) {
                node->condition->end_value = not_nodes.at(node->condition->end_value.get());
                auto tmp = node->then_block;
                node->then_block = node->else_block;
                node->else_block = tmp;
            }
            replace_with_mark(node->condition->end_value);
        }
        
        void onEgressWhileNode(WhileNode* node) override {
            replace_with_mark(node->condition->end_value);
        }

        void onEgressNotNode(NotNode* node) override {
            replace_with_mark(node->value);
            std::shared_ptr<ValueNode> my_val = node->value;
            if (not_nodes.contains(node->value.get())) {
                marks.insert({node, not_nodes.at(node->value.get())});
            }
            else {
                not_nodes.insert({node, my_val});
            }
        }

        void onEgressOperatorApplicationNode(OperatorApplicationNode* node) override {
            replace_with_mark(node->lhs);
            replace_with_mark(node->rhs);

            // If the rhs isn't complex then there's no point of short circuiting
            // As the rhs will already be evaluated (eager moment)
            if (ComplexDetector::IsComplex(node->rhs.get())) {
                if (node->op == "and") {
                    // Holy tab
                    std::shared_ptr<SelectOperatorNode> sel = std::make_shared<SelectOperatorNode>(node->lhs,
                                                                                                   node->rhs,
                                                                                                   std::make_shared<BooleanNode>(false)
                    );
                    sel->type = "Boolean";
                    marks.insert({node, sel});
                }
                else if (node->op == "or") {
                    std::shared_ptr<SelectOperatorNode> sel = std::make_shared<SelectOperatorNode>(node->lhs,
                                                                                                   std::make_shared<BooleanNode>(true),
                                                                                                   node->rhs
                    );
                    sel->type = "Boolean";
                    marks.insert({node, sel});
                }
            }
        }

        void onEgressSelectOperatorNode(SelectOperatorNode* node) override {
            replace_with_mark(node->condition->end_value);
            replace_with_mark(node->true_value->end_value);
            replace_with_mark(node->false_value->end_value);

            if (not_nodes.contains(node->condition->end_value.get())) {
                node->condition->end_value = not_nodes.at(node->condition->end_value.get());
                auto tmp = node->true_value;
                node->true_value = node->false_value;
                node->false_value = tmp;
            }
        }
};

void short_circuitify(ProgramNode* program) {
    TransformToShortCircuit c;
    c.walk(program);
}
