#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <RemoveComplexOperands.hpp>
#include <memory>
#include <string>
#include <vector>

std::string gen_tmp_name() {
    static int tmp_counter = 0;
    return "tmp" + std::to_string(tmp_counter++);
}

// Is this scuffed? YES!
// Do I care? YES!
// Is this making me insecure? YES!
// Will I fix it? Maybe.........
class ComplexDetector : public ShuLangVisitor {
    private:
        bool is_complex = false;
    public:
        bool NeedToRebind(ShuLangNode* node) {
            walk(node);
            bool ret = is_complex;
            is_complex = false;
            return ret;
        }

        ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override {
            is_complex = true;
            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }
};

// This class takes in an AST that doesn't have to be atomic
// And tries to ensure its children are
class target_complex : public ShuLangVisitor {
    private:
        std::shared_ptr<VariableReferenceNode> generate_binding(std::shared_ptr<ValueNode> complex_value) {
            std::shared_ptr<BindingNode> fresh = std::make_unique<BindingNode>();
            std::string name = gen_tmp_name();
            fresh->name = name;
            // TODO: Assign type
            fresh->ty = complex_value->type;
            fresh->value = complex_value;
            bindings.push_back(fresh);
            return std::make_unique<VariableReferenceNode>(name);
        }

    public:
        std::vector<std::shared_ptr<BindingNode>> bindings;
        
        ShuLangNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override {
            // For operators, their lhs and rhs must be atomic
            ComplexDetector det;
            if (det.NeedToRebind(node->lhs.get())) {
                node->lhs = generate_binding(node->lhs);
            }

            if (det.NeedToRebind(node->rhs.get())) {
                node->rhs = generate_binding(node->rhs);
            }

            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }

        ShuLangNode* egressPrintNode(PrintNode* node) override {
            ComplexDetector det;
            // to_print must be atomic
            if (det.NeedToRebind(node->to_print.get())) {
                node->to_print = generate_binding(node->to_print);
            }
            return ShuLangVisitor::egressPrintNode(node);
        }

        ShuLangNode* egressIfNode(IfNode* node) override {
            ComplexDetector det;
            // Condition must be atomic
            if (det.NeedToRebind(node->condition.get())) {
                node->condition = generate_binding(node->condition);
            }

            // TODO
            // Test cases for complex operands inside of if bodies 
            // as well as the condition :3
            return ShuLangVisitor::egressIfNode(node);
        }
};

void remove_complex_operands(ProgramNode* program) {
    for (long i = 0; i < program->nodes.size(); i++) {
        target_complex visitor = target_complex();
        visitor.walk(program->nodes.at(i).get());

        int len = visitor.bindings.size();
        for (int j = 0; j < len; j++) {
            program->nodes.insert(program->nodes.begin() + i, std::move(visitor.bindings.at(j)));
            i += 1;
        }
    }
}
