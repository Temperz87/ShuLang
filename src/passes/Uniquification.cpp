#include <AST.hpp>
#include <Visitor.hpp>
#include <Uniquification.hpp>
#include <ShuLangVisitor.hpp>
#include <string>

Uniquification::Uniquification() { };
Uniquification::~Uniquification() { };

// TODO: Make this work when I introduce functions

Uniquification::ASTHolder Uniquification::ingressBindingNode(BindingNode* node, int childcount) {
    std::string unique_name = node->name + "." + std::to_string(unique_id++);

    // Check if we've already assigned a name
    // If so update it 
    if (map.find(node->name) == map.end())
        map.insert({node->name, unique_name});
    else
        map[node->name] = unique_name;
    node->name = unique_name;
    return ShuLangVisitor::ingressBindingNode(node, childcount);
}

Uniquification::ASTHolder Uniquification::ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) {
    node->identifier = map.at(node->identifier);
    return ShuLangVisitor::ingressVariableReferenceNode(node, childcount);
}
