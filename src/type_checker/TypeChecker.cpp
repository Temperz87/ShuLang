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

TypeChecker::ASTHolder TypeChecker::ingressBindingNode(BindingNode* node, int childcount) { 
    if (node->ty != "Inferred") {
        if (variable_types.find(node->name) == variable_types.end())
            variable_types.insert({node->name, node->ty});
        else
            variable_types.at(node->name) = node->ty;
    }
    
    return ShuLangVisitor::ingressBindingNode(node, childcount);
}

ShuLangNode* TypeChecker::egressBindingNode(BindingNode* node) { 
    if (node->ty == "Inferred") {
        node->ty = node->value->type;
        if (variable_types.find(node->name) == variable_types.end())
            variable_types.insert({node->name, node->ty});
        else
            variable_types.at(node->name) = node->ty;
    }
    else 
        assert_same(node->ty, node->value->type, "Variable " + node->name + "was bound to something of the wrong type");
    
    return ShuLangVisitor::egressBindingNode(node);
}

        
ShuLangNode* TypeChecker::egressVariableReferenceNode(VariableReferenceNode* node) {
    node->type = variable_types.at(node->identifier);
    return ShuLangVisitor::egressVariableReferenceNode(node);
}

ShuLangNode* TypeChecker::egressOperatorApplicationNode(OperatorApplicationNode* node) { 
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
    return ShuLangVisitor::egressOperatorApplicationNode(node);
}

ShuLangNode* TypeChecker::egressIfNode(IfNode* node) { 
    assert_same("Boolean", node->condition->type, "Condition for if was not of boolean type");
    return ShuLangVisitor::egressIfNode(node);
}