#include <ComplexDetector.hpp>
#include <ShuLangPasses.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <memory>
#include <stack>
#include <string>
#include <vector>


using namespace std;

// This class takes in an AST that doesn't have to be atomic
// And tries to ensure its children are
class target_complex : public ShuLangVisitor {
    private:
        vector<shared_ptr<ShuLangNode>>* program_nodes;
        stack<BeginNode*> writing_to;

        bool updated_inserted = true;
        long insert_position;

        shared_ptr<VariableReferenceNode> generate_binding(shared_ptr<ValueNode> complex_value) {
            static int tmp_counter = 0;
            string name = "rco_output." + to_string(tmp_counter++);

            shared_ptr<BindingNode> fresh = make_unique<BindingNode>(name, complex_value->type, complex_value);
            if (writing_to.empty()) {
                program_nodes->insert(program_nodes->begin() + insert_position, fresh);

                insert_position += 1;

                if (updated_inserted) {
                    inserted += 1;
                }
            }
            else {
                vector<shared_ptr<StatementNode>>& statements = writing_to.top()->statements;
                // Should be safe to always insert at the end of the node for now
                statements.insert(statements.end(), fresh);
            }

            shared_ptr<VariableReferenceNode> ref = make_shared<VariableReferenceNode>(name);
            ref->type = complex_value->type;
            return ref;
        }

    public:
        int inserted = 0;
        
        void visitNode(OperatorApplicationNode* node) override {
            descendIntoChildren(node);
            // For operators, their lhs and rhs must be atomic
            if (ComplexDetector::IsComplex(node->lhs.get())) {
                node->lhs = generate_binding(node->lhs);
            }

            if (ComplexDetector::IsComplex(node->rhs.get())) {
                node->rhs = generate_binding(node->rhs);
            }
        }

        void visitNode(NotNode* node) override {
            descendIntoChildren(node);
            // Value must be atomic
            if (ComplexDetector::IsComplex(node->value.get())) {
                node->value = generate_binding(node->value);
            }
        }

        void visitNode(BeginNode* node) override {
            writing_to.push(node);
            descendIntoChildren(node);
            writing_to.pop();
        }

        void visitNode(CallNode* node) override {
            descendIntoChildren(node);
            for (int i = 0; i < node->arguments.size(); i++) {
                if (ComplexDetector::IsComplex(node->arguments[i].get())) {
                    node->arguments[i] = generate_binding(node->arguments[i]);
                }
            }
        }

        void visitNode(BodyNode* node) override {
            program_nodes = &node->nodes;
            insert_position = 0;
            updated_inserted = false;
            for (ShuLangNode* node : node->children()) {
                node->accept(this);
                insert_position += 1;
            }
        }

        void visitNode(ProgramNode* node) override {
            visitNode(static_cast<BodyNode*>(node));
        }
};

void remove_complex_operands(ProgramNode* program) {
    target_complex visitor;
    program->accept(&visitor);
}
