#include <AST.hpp>
#include <Visitor.hpp>
#include <Uniquification.hpp>
#include <ASTVisitor.hpp>
#include <iostream>
#include <string>
#include <vector>

Uniquification::Uniquification() { };
Uniquification::~Uniquification() { };

Uniquification::ASTHolder Uniquification::ingressBindingNode(BindingNode* node, int childcount) {
    std::string unique_name = node->name + "." + std::to_string(unique_id);

    if (map.find(node->name) == map.end())
        map.insert({node->name, unique_name});
    else
        map[node->name] = unique_name;
    unique_id += 1;
    node->name = unique_name;
    return ASTVisitor::ingressBindingNode(node, childcount);
}

Uniquification::ASTHolder Uniquification::ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) {
    node->identifier = map.at(node->identifier);
    return ASTVisitor::ingressVariableReferenceNode(node, childcount);
}
