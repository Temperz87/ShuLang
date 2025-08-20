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
        std::vector<std::shared_ptr<ShuLangNode>>* program_nodes;
        bool updated_inserted = true;
        long insert_position;

        std::shared_ptr<VariableReferenceNode> generate_binding(std::shared_ptr<ValueNode> complex_value) {
            static int tmp_counter = 0;
            std::string name = "rco_output." + std::to_string(tmp_counter++);

            std::shared_ptr<BindingNode> fresh = std::make_unique<BindingNode>();
            fresh->name = name;
            fresh->ty = complex_value->type;
            fresh->value = complex_value;
            program_nodes->insert(program_nodes->begin() + insert_position, fresh);
            insert_position += 1;

            if (updated_inserted) {
                inserted += 1;
            }

            std::shared_ptr<VariableReferenceNode> ref = std::make_shared<VariableReferenceNode>(name);
            ref->type = complex_value->type;
            return ref;
        }

    public:
        int inserted = 0;
        target_complex(std::vector<std::shared_ptr<ShuLangNode>>* nodes, long current_position):program_nodes(nodes), insert_position(current_position) { }
        
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
            // to_print must be atomic
            if (ComplexDetector::IsComplex(node->to_print.get())) {
                node->to_print = generate_binding(node->to_print);
            }
            return ShuLangVisitor::egressPrintNode(node);
        }

        ShuLangNode* egressIfNode(IfNode* node) override {
            // Condition must be atomic
            if (ComplexDetector::IsComplex(node->condition.get())) {
                node->condition = generate_binding(node->condition);
            }

            return ShuLangVisitor::egressIfNode(node);
        }

        ShuLangNode* egressNotNode(NotNode* node) override {
            // Value must be atomic
            if (ComplexDetector::IsComplex(node->value.get())) {
                node->value = generate_binding(node->value);
            }

            return ShuLangVisitor::egressNotNode(node);
        }

        ShuLangNode* egressSelectOperatorNode(SelectOperatorNode* node) override {
            // // Condition must be atomic
            // if (ComplexDetector::IsComplex(node->condition.get())) {
            //     node->condition = generate_binding(node->condition);
            // }

            // However for the other 2 values we leave them as complex
            // As we'll do some funky jump stuff later

            return ShuLangVisitor::egressSelectOperatorNode(node);
        }

        ASTHolder ingressBodyNode(BodyNode* node, int childcount) override {
            program_nodes = &node->nodes;
            insert_position = 0;
            updated_inserted = false;
            return ShuLangVisitor::ingressBodyNode(node, childcount);
        }
};

void remove_complex_operands(ProgramNode* program) {
    for (long i = 0; i < program->nodes.size(); i++) {
        target_complex visitor = target_complex(&program->nodes, i);
        visitor.walk(program->nodes.at(i).get());
        i += visitor.inserted;
    }
}
