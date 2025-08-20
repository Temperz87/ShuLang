#include <ComplexDetector.hpp>
#include <ShuLangPasses.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <memory>
#include <stack>
#include <string>
#include <vector>


// This class takes in an AST that doesn't have to be atomic
// And tries to ensure its children are
class target_complex : public ShuLangVisitor {
    private:
        std::vector<std::shared_ptr<ShuLangNode>>* program_nodes;
        std::stack<BeginNode*> writing_to;

        bool updated_inserted = true;
        long insert_position;

        std::shared_ptr<VariableReferenceNode> generate_binding(std::shared_ptr<ValueNode> complex_value) {
            static int tmp_counter = 0;
            std::string name = "rco_output." + std::to_string(tmp_counter++);

            std::shared_ptr<BindingNode> fresh = std::make_unique<BindingNode>(name, complex_value->type, complex_value);
            if (writing_to.empty()) {
                program_nodes->insert(program_nodes->begin() + insert_position, fresh);

                insert_position += 1;

                if (updated_inserted) {
                    inserted += 1;
                }
            }
            else {
                std::vector<std::shared_ptr<StatementNode>>& statements = writing_to.top()->statements;
                // Should be safe to always insert at the end of the node for now
                statements.insert(statements.end(), fresh);
            }

            std::shared_ptr<VariableReferenceNode> ref = std::make_shared<VariableReferenceNode>(name);
            ref->type = complex_value->type;
            return ref;
        }

    public:
        int inserted = 0;
        target_complex(std::vector<std::shared_ptr<ShuLangNode>>* nodes, long current_position):program_nodes(nodes), insert_position(current_position) { }
        
        void onEgressOperatorApplicationNode(OperatorApplicationNode* node) override {
            // For operators, their lhs and rhs must be atomic
            if (ComplexDetector::IsComplex(node->lhs.get())) {
                node->lhs = generate_binding(node->lhs);
            }

            if (ComplexDetector::IsComplex(node->rhs.get())) {
                node->rhs = generate_binding(node->rhs);
            }
        }

        void onEgressPrintNode(PrintNode* node) override {
            // to_print must be atomic
            if (ComplexDetector::IsComplex(node->to_print.get())) {
                node->to_print = generate_binding(node->to_print);
            }
        }

        void onEgressIfNode(IfNode* node) override {
            // Condition must be atomic
            if (ComplexDetector::IsComplex(node->condition.get())) {
                node->condition = generate_binding(node->condition);
            }
        }

        void onEgressNotNode(NotNode* node) override {
            // Value must be atomic
            if (ComplexDetector::IsComplex(node->value.get())) {
                node->value = generate_binding(node->value);
            }
        }

        void onIngressBeginNode(BeginNode* node) override {
            writing_to.push(node);
        }

        void onEgressBeginNode(BeginNode* node) override {
            writing_to.pop();
        }

        void onIngressBodyNode(BodyNode* node) override {
            program_nodes = &node->nodes;
            insert_position = 0;
            updated_inserted = false;
        }
};

void remove_complex_operands(ProgramNode* program) {
    for (long i = 0; i < program->nodes.size(); i++) {
        target_complex visitor = target_complex(&program->nodes, i);
        visitor.walk(program->nodes.at(i).get());
        i += visitor.inserted;
    }
}
