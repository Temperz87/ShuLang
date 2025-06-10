#include <ASTNode.hpp>
#include <ShuIRAST.hpp>
#include <string>
#include <vector>

using namespace shuir;

std::vector<std::string> SIRNode::get_usages() {
    return std::vector<std::string>();
}

DefinitionNode::DefinitionNode(std::string identifier, SIRNode* binding) {
    this->identifier = identifier;
    this->binding = binding;
}

std::vector<std::string> DefinitionNode::get_usages() {
    std::vector<std::string> other_usages = binding->get_usages();
    other_usages.insert(other_usages.begin(), this->identifier);
    return other_usages;
}

ImmediateNode::ImmediateNode(int number) {
    this->number = number;
}

ReferenceNode::ReferenceNode(std::string identifier) {
    this->identifier = identifier;
}

std::vector<std::string> AddNode::get_usages() {
    std::vector<std::string> lhs_usage = lhs->get_usages();
    std::vector<std::string> rhs_usage = rhs->get_usages();
    lhs_usage.insert(lhs_usage.end(), rhs_usage.begin(), rhs_usage.end());
    return lhs_usage;
}

PrintNode::PrintNode(ValueNode* to_print) {
    this->to_print= to_print;
}
std::vector<std::string> PrintNode::get_usages() {
    return to_print->get_usages();
}