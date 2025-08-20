#include <ShuLangAST.hpp>
#include <Uniquification.hpp>
#include <ShuLangVisitor.hpp>
#include <string>

using namespace shulang;

Uniquification::Uniquification() { };
Uniquification::~Uniquification() { };

void Uniquification::onEgressBindingNode(BindingNode* node) {

    // Check if we've already assigned a name
    if (map.find(node->name) == map.end()) {
        std::string unique_name = node->name + "." + std::to_string(unique_id++);
        map.insert({node->name, unique_name});
    }
    
    // No need to reupdate when we can use alloca's later
    // At some point I'll need to phi 
    // But we'll get there when we get there
    node->name = map.at(node->name);
}

void Uniquification::onIngressVariableReferenceNode(VariableReferenceNode* node) {
    node->identifier = map.at(node->identifier);
}

void uniquify(shulang::ProgramNode* ast) {
    Uniquification u;
    u.walk(ast);
}
