#include <ShuLangAST.hpp>
#include <cassert>
#include <iostream>
#include <iterator.hpp>
#include <memory>
#include <parser.hpp>
#include <tokenizer.hpp>
#include <vector>

// Handwritten recursive descent parser
static Iterator<token> iter;
static token currenttoken;
static std::string filename;

void advance() {
    iter.advance();
    
    // if (!iter.empty())
        // std::cout << "Iterator now at " << currenttoken.value << std::endl;
    // else
        // std::cout << "Iterator empty" << std::endl;

    iter.get(currenttoken);
}

void parse_error(std::string msg) {
    std::cout << msg << std::endl << "\tWhile at token " << currenttoken.value << std::endl << "At " << filename << ":" << currenttoken.line << ":" << currenttoken.col_start << std::endl; 
    exit(1);
}

void assert_strings_equal(std::string actual, std::string expected) {
    if (expected != actual) {
        parse_error("Expected " + expected + " but instead got " + actual);
    }
}

void assert_at_value(std::string expected) {
    assert_strings_equal(currenttoken.value, expected);
}


void assert_at_type(token_type expected) {
    if (expected != currenttoken.type) {
        // TODO: Make error better
        // I need a way to go from enum to string
        parse_error("Unexpected token");
    }
}

std::shared_ptr<ValueNode> parse_complex_value();

void parse_identifier(std::string& buf) {
    if (currenttoken.type != IDENTIFIER) {
        parse_error("This does not appear to be a valid identifier");
    }
    buf = currenttoken.value;
    advance();
}

void parse_type(std::string& buf) {
    if (currenttoken.type != TYPE) {
        // TODO: ERROR
        parse_error("Expected a type");
    }

    buf = "";
    while (currenttoken.type == TYPE) {
        buf += currenttoken.value; // TODO: SOMETHING THAT ISNT AS EXPENSIVE AS CONCAT
        advance();
    }
}

void parse_type_annot(std::string& buf) {
    assert_at_value(":");
    advance();
    parse_type(buf);
}

std::shared_ptr<IntegerNode> parse_integer() {
    token mytoken = currenttoken;
    advance();
    return std::make_shared<IntegerNode>(IntegerNode(stoi(mytoken.value)));
}

std::shared_ptr<ValueNode> parse_value() {
    switch (currenttoken.type){
        case INTEGER:
            return parse_integer();
        case VALUE:
            // TODO: PARSE EVERYTHING ELSE
            break;
        case IDENTIFIER:
            std::string ident = currenttoken.value;
            advance();
            return std::make_shared<VariableReferenceNode>(VariableReferenceNode(ident));
    }
    parse_error("Expected a value (e.g. 5)");
}

std::shared_ptr<OperatorApplicationNode> parse_operator_application(std::shared_ptr<ValueNode> lhs) {
    std::string op = currenttoken.value;
    if (op != "+" && op != "-" && op != "*") {
        parse_error("Expected +, -, or *");
    }
    advance();
    std::shared_ptr<ValueNode> rhs = parse_complex_value();
    
    std::shared_ptr<OperatorApplicationNode> node = std::make_shared<OperatorApplicationNode>();
    node->lhs = std::move(lhs); 
    node->rhs = std::move(rhs);
    node->op = op;
    return node; 
}

std::shared_ptr<ValueNode> parse_complex_value() {
    std::shared_ptr<ValueNode> ret;
    switch (currenttoken.type) {
        case INTEGER:
        case VALUE:
        case IDENTIFIER:
            ret = parse_value();
            if (currenttoken.type == OPERATOR)
                return parse_operator_application(std::move(ret));
            return ret;
        case PUNCTUATOR:
            assert_at_value("(");
            advance();
            ret = parse_complex_value();
            assert_at_value(")");
            advance();
            if (currenttoken.type == OPERATOR)
                return parse_operator_application(std::move(ret));
            return ret;
        default:
            parse_error("Expected a value");
    }
}

std::shared_ptr<StatementNode> parse_statement() {
    if (currenttoken.value == "bind") {
        advance();
        std::shared_ptr<BindingNode> b = std::make_shared<BindingNode>();
        parse_identifier(b->name);
        parse_type_annot(b->ty);
        assert_strings_equal(currenttoken.value, "to");
        advance();
        b->value = parse_complex_value();
        return b;
    }
    else if (currenttoken.value == "print") {
        advance();
        assert_strings_equal(currenttoken.value, "(");
        advance();
        std::shared_ptr<ValueNode> to_print = parse_complex_value();
        assert_strings_equal(currenttoken.value, ")");
        advance();
        return std::make_shared<PrintNode>(std::move(to_print));
    }
    else {
        parse_error("Expected a statement");
    }
}

std::unique_ptr<ProgramNode> begin_parse(std::vector<token> tokenlist, std::string fileToParse) {
    filename = fileToParse;
    iter = Iterator<token>(tokenlist);
    iter.get(currenttoken);
    std::unique_ptr<ProgramNode> program = std::make_unique<ProgramNode>();
    while (!iter.empty()) {
        program->nodes.push_back(parse_statement());
    }
    return program;
}
