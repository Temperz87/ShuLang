#include "AST.hpp"
#include "Visitor.hpp"
#include <Uniquification.hpp>
#include <ASTVisitor.hpp>
#include <vector>

Uniquification::Uniquification() { };
Uniquification::~Uniquification() { };

ASTNode* Uniquification::egressBindingNode(BindingNode* node, std::vector<ASTNode*> children) {
    node->name += "." + std::to_string(unique_id);
    unique_id += 1;
    return ASTVisitor::egressBindingNode(node, children);
}