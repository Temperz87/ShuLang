#include "ASTPrinter.hpp"
#include <AST.hpp>
#include <ASTVisitor.hpp>
#include <RemoveComplexOperands.hpp>
#include <iterator>
#include <string>
#include <vector>

static int tmp_counter = 0;


std::string gen_tmp_name() {
    return "tmp" + std::to_string(tmp_counter++);
}

class Atomify : public ASTVisitor {
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

            return ASTVisitor::egressOperatorApplicationNode(node);
        }
};

class target_complex : public ASTVisitor {
    public:
        std::vector<BindingNode*> bindings;
        
        ASTNode* egressOperatorApplicationNode(OperatorApplicationNode* node) override {
            std::vector<BindingNode*> bindings;

            Atomify a = Atomify(bindings);
            a.walk(node->lhs);
            if (!bindings.empty()) {
                BindingNode* last_node = bindings.at(bindings.size() - 1);
                VariableReferenceNode* new_value = new VariableReferenceNode(last_node->name);
                node->lhs = new_value;
            }
            long size = bindings.size();

            a.walk(node->rhs);
            if (bindings.size() != size) {
                BindingNode* last_node = bindings.at(bindings.size() - 1);
                VariableReferenceNode* new_value = new VariableReferenceNode(last_node->name);
                node->rhs = new_value;
            }

            this->bindings.insert(this->bindings.end(), bindings.begin(), bindings.end());
            return ASTVisitor::egressOperatorApplicationNode(node);
        }

        ASTNode* egressPrintNode(PrintNode* node) override {
            Atomify a = Atomify(bindings);
            a.walk(node->to_print);
            if (!bindings.empty()) {
                BindingNode* last_node = bindings.at(bindings.size() - 1);
                VariableReferenceNode* new_value = new VariableReferenceNode(last_node->name);
                node->to_print = new_value;
            }
            return ASTVisitor::egressPrintNode(node);
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