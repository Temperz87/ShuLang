#include <ShuLangAST.hpp>
#include <ShuLangVisitor.hpp>
#include <TypeChecker.hpp>
#include <iostream>

using namespace shulang;

// Bidirectional Typechecker
// To do typchecking we have to ask ourselves
// Should I be getting a type from below and checking
// Or should I be creating a type?

void TypeChecker::assert_same(std::string expected, std::string actual, std::string error_msg) {
    if (expected != actual) {
        std::cout << "ShuC: " << error_msg << std::endl;
        std::cout << "\tExpected " << expected << " but got " << actual << std::endl;
        exit(1);
    }
}

void TypeChecker::onIngressBindingNode(BindingNode* node) { 
    if (node->type != "Inferred") {
        variable_types.insert({node->identifier, node->type});
    }
}

void TypeChecker::onEgressBindingNode(BindingNode* node) { 
    if (node->type == "Inferred") {
        node->type = node->value->type;
        variable_types.insert({node->identifier, node->type});
    }
    else 
        assert_same(node->type, node->value->type, "Variable " + node->identifier + " was bound to a value of the wrong type");
}
        
void TypeChecker::onEgressVariableReferenceNode(VariableReferenceNode* node) {
    if (!variable_types.contains(node->identifier)) {
        std::cout << node->identifier << " was used before it was declared!" << std::endl;
        exit(1);
    }
    node->type = variable_types.at(node->identifier);
}

void TypeChecker::onEgressOperatorApplicationNode(OperatorApplicationNode* node) { 
    std::string expected_type;
    std::string error_msg;
    if (node->op == "=" || node->op == "!=") {
        node->type = "Boolean";
        expected_type = node->lhs->type;
        error_msg = "The lhs and rhs of an '=' were not the same";
    }
    else if (node->op == "+" || node->op == "-" || node->op == "*") {
        node->type = "Integer";
        expected_type = "Integer";
        error_msg = "Expected two expressions of type Integer for " + node->op;
    }
    else if (node->op == "and" || node->op == "or" || node->op == "xor") {
        node->type = "Boolean";
        expected_type = "Boolean";
        error_msg = "Expected two expressions of type Boolean for " + node->op;
    }
    else if (node->op == "<" || node->op == "<=" || node->op == ">" || node->op == ">=") {
        node->type = "Boolean";
        expected_type = "Integer";
        error_msg = "Expected two expressions of type Integer for " + node->op;
    }
    else {
        std::cout << "ShuC: Hey I forgot to add the correct type for " << node->op << std::endl;
    }

    assert_same(expected_type, node->lhs->type, error_msg);
    assert_same(expected_type, node->rhs->type, error_msg);
}

void TypeChecker::onEgressNotNode(NotNode* node) { 
    assert_same("Boolean", node->value->type, "\'not\' had the wrong type!");
}


void TypeChecker::onEgressBeginNode(BeginNode* node) {
    node->type = node->end_value->type;
}

void TypeChecker::onEgressSelectOperatorNode(SelectOperatorNode* node) {
    assert_same("Boolean", node->condition->end_value->type, "Unexpected type for condition of if ternary");
    assert_same(node->true_value->end_value->type, node->false_value->end_value->type, "The type of the \"else\" of an if ternary must match the \"then\" type");    
    node->type = node->true_value->type;
}

void TypeChecker::onEgressIfNode(IfNode* node) { 
    assert_same("Boolean", node->condition->type, "Unexpected type for condition of if statement");
}
