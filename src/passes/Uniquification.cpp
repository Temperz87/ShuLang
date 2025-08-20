#include <ShuLangAST.hpp>
#include <Uniquification.hpp>
#include <ShuLangVisitor.hpp>
#include <string>

using namespace shulang;

Uniquification::Uniquification() { };
Uniquification::~Uniquification() { };

void Uniquification::onEgressBindingNode(BindingNode* node) {

    // Check if we've already assigned a name
    if (map.find(node->identifier) == map.end()) {
        std::string unique_name = node->identifier + "." + std::to_string(unique_id++);
        map.insert({node->identifier, unique_name});
    }
    
    // No need to reupdate when we can use alloca's later
    // At some point I'll need to phi 
    // But we'll get there when we get there
    node->identifier = map.at(node->identifier);
}

void Uniquification::onIngressVariableReferenceNode(VariableReferenceNode* node) {
    node->identifier = map.at(node->identifier);
}

void uniquify(shulang::ProgramNode* ast) {
    Uniquification u;
    u.walk(ast);
}
