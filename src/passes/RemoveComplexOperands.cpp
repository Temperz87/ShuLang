#include <ComplexDetector.hpp>
#include <ShuLangPasses.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <memory>
#include <string>
#include <vector>


// This class takes in an AST that doesn't have to be atomic
// And tries to ensure its children are
class target_complex : public ShuLangVisitor {
    private:
        std::shared_ptr<VariableReferenceNode> generate_binding(std::shared_ptr<ValueNode> complex_value) {
            static int tmp_counter = 0;
            std::string name = "rco_output." + std::to_string(tmp_counter++);

            std::shared_ptr<BindingNode> fresh = std::make_unique<BindingNode>();
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
            if (ComplexDetector::IsComplex(node->lhs.get())) {
                node->lhs = generate_binding(node->lhs);
            }

            if (ComplexDetector::IsComplex(node->rhs.get())) {
                node->rhs = generate_binding(node->rhs);
            }

            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }

        ShuLangNode* egressPrintNode(PrintNode* node) override {
            ComplexDetector det;
            // to_print must be atomic
            if (ComplexDetector::IsComplex(node->to_print.get())) {
                node->to_print = generate_binding(node->to_print);
            }
            return ShuLangVisitor::egressPrintNode(node);
        }

        ShuLangNode* egressIfNode(IfNode* node) override {
            ComplexDetector det;
            // Condition must be atomic
            if (ComplexDetector::IsComplex(node->condition.get())) {
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
