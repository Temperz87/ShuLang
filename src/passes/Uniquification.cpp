#include <ShuLangAST.hpp>
#include <Uniquification.hpp>
#include <ShuLangVisitor.hpp>
#include <string>

using namespace shulang;

Uniquification::Uniquification() { };
Uniquification::~Uniquification() { };

ShuLangNode* Uniquification::egressBindingNode(BindingNode* node) {

    // Check if we've already assigned a name
    if (map.find(node->name) == map.end()) {
        std::string unique_name = node->name + "." + std::to_string(unique_id++);
        map.insert({node->name, unique_name});
    }
    
    // No need to reupdate when we can use alloca's later
    // At some point I'll need to phi 
    // But we'll get there when we get there
    node->name = map.at(node->name);
    return ShuLangVisitor::egressBindingNode(node);
}

Uniquification::ASTHolder Uniquification::ingressVariableReferenceNode(VariableReferenceNode* node, int childcount) {
    node->identifier = map.at(node->identifier);
    return ShuLangVisitor::ingressVariableReferenceNode(node, childcount);
}

void uniquify(shulang::ProgramNode* ast) {
    Uniquification u;
    u.walk(ast);
}
