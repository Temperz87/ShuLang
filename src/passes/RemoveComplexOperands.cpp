#include <AST.hpp>
#include <ShuLangVisitor.hpp>
#include <RemoveComplexOperands.hpp>
#include <string>
#include <vector>

static int tmp_counter = 0;

std::string gen_tmp_name() {
    return "tmp" + std::to_string(tmp_counter++);
}

// Anything this class walks will be converted to be atomic
class Atomify : public ShuLangVisitor {
    public:
        std::vector<BindingNode*>& bindings; 

        Atomify(std::vector<BindingNode*>& bindings):bindings(bindings) {}

        ASTNode* egressOperatorApplicationNode(OperatorApplicationNode *node) override {
            BindingNode* new_binding = new BindingNode();
            new_binding->name = gen_tmp_name();
            new_binding->value = node;

            // TODO: Support other types when they come
            new_binding->ty = "Integer";

            bindings.push_back(new_binding); 

            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }
};

// This class takes in an AST that doesn't have to be atomic
// And tries to ensure its children are
class target_complex : public ShuLangVisitor {
    public:
        std::vector<BindingNode*> bindings;
        
        ASTNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override {
            // The bindings in the class clearly get propagated through every egress
            // So we must have unique bindings for every time we Atomify
            std::vector<BindingNode*> bindings;

            // For operators, their lhs and rhs must be atomic
            Atomify a = Atomify(bindings);
            a.walk(node->lhs);

            // If there are new bindings then lhs wasn't atomic
            // So reference the last binding as the new lhs
            if (!bindings.empty()) {
                BindingNode* last_node = bindings.at(bindings.size() - 1);
                VariableReferenceNode* new_value = new VariableReferenceNode(last_node->name);
                node->lhs = new_value;
            }
            long size = bindings.size();

            a.walk(node->rhs);
            
            // If the size changed then there are new bindings
            if (bindings.size() != size) {
                BindingNode* last_node = bindings.at(bindings.size() - 1);
                VariableReferenceNode* new_value = new VariableReferenceNode(last_node->name);
                node->rhs = new_value;
            }

            // Insert to this->bindings
            // Which kind of acts as a return
            // Could probably change this to like an iterator position to update
            this->bindings.insert(this->bindings.end(), bindings.begin(), bindings.end());
            return ShuLangVisitor::egressOperatorApplicationNode(node);
        }

        ASTNode* egressPrintNode(PrintNode* node) override {
            Atomify a = Atomify(bindings);
            // to_print must be atomic
            a.walk(node->to_print);
            if (!bindings.empty()) {
                BindingNode* last_node = bindings.at(bindings.size() - 1);
                VariableReferenceNode* new_value = new VariableReferenceNode(last_node->name);
                node->to_print = new_value;
            }
            return ShuLangVisitor::egressPrintNode(node);
        }
};

void remove_complex_operands(std::vector<ASTNode*>& program) {
    for (long i = 0; i < program.size(); i++) {
        target_complex visitor = target_complex();
        visitor.walk(program.at(i));
        for (BindingNode* binding : visitor.bindings) {
            program.insert(program.begin() + i, binding);
            i++;
        }
    }
}
