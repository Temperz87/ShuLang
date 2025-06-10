#include <ShuLangAST.hpp>
#include <cassert>
#include <cstddef>
#include <iostream>
#include <iterator.hpp>
#include <parser.hpp>
#include <string.h>
#include <tokenizer.hpp>
#include <vector>

// Handwritten recursive descent parser
static Iterator<token> iter;
static token currenttoken;
static std::string filename;

void advance() {
    iter.advance();
    
    // if (!iter.empty())
    //     std::cout << "Iterator now at " << currenttoken.value << std::endl;
    // else
    //     std::cout << "Iterator empty" << std::endl;

    iter.get(currenttoken);
}

void parse_error(std::string msg) {
    std::cout << msg << std::endl << "\tWhile parsing " << currenttoken.value << std::endl << "At " << filename << ":" << currenttoken.line << ":" << currenttoken.col_start << std::endl; 
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

StatementNode* parse_statement();
OperatorApplicationNode* parse_infix();
ValueNode* parse_complex_value();

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

IntegerNode* parse_integer() {
    token mytoken = currenttoken;
    advance();
    return new IntegerNode(stoi(mytoken.value));
}

ValueNode* parse_value() {
    switch (currenttoken.type){
        case INTEGER:
            return parse_integer();
        case VALUE:
            // TODO: PARSE EVERYTHING ELSE
            break;
        case IDENTIFIER:
            std::string ident = currenttoken.value;
            advance();
            return new VariableReferenceNode(ident);
    }
    // TODO: ERROR
    parse_error("Expected a value");
}

OperatorApplicationNode* parse_operator_application(ValueNode* lhs) {
    OperatorApplicationNode* op = new OperatorApplicationNode();
    op->lhs = lhs;
    op->op = currenttoken.value;
    advance();
    op->rhs = parse_complex_value();
    return op;
}

ValueNode* parse_complex_value() {
    ValueNode* ret;
    switch (currenttoken.type) {
        case INTEGER:
        case VALUE:
        case IDENTIFIER:
            ret = parse_value();
            if (currenttoken.type == OPERATOR)
                return parse_operator_application((ValueNode*)ret);
            return ret;
        case PUNCTUATOR:
            assert_at_value("(");
            advance();
            ret = parse_complex_value();
            assert_at_value(")");
            advance();
            if (currenttoken.type == OPERATOR)
                return parse_operator_application(ret);
            return ret;
        default:
            parse_error("Expected some sort of value");
    }
}

OperatorApplicationNode* parse_infix() {
    OperatorApplicationNode* opapp = new OperatorApplicationNode();
    opapp->lhs = parse_complex_value();
    assert_at_type(OPERATOR);
    opapp->op = currenttoken.value;
    advance();
    opapp->rhs = parse_complex_value();
    return opapp;
}

StatementNode* parse_statement() {
    if (currenttoken.value == "bind") {
        advance();
        BindingNode* b = new BindingNode();
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
        StatementNode* toPrint = parse_complex_value();
        assert_strings_equal(currenttoken.value, ")");
        advance();
        return new PrintNode(toPrint);
    }
    else {
        return parse_infix();
    }
}

StatementNode* parse_top_level_statement() {
    switch (currenttoken.type) {
        case STATEMENT:
            return parse_statement();
        case PUNCTUATOR:
            assert_at_value("(");
            break;
        default:
            // TODO: Parse Error
        parse_error("Unexpected token as top level statement");
    }
}

ProgramNode* begin_parse(std::vector<token> tokenlist, std::string fileToParse) {
    filename = fileToParse;

    iter = Iterator<token>(tokenlist);
    iter.get(currenttoken);    
    ProgramNode* program = new ProgramNode();
    while (!iter.empty()) {
        program->nodes.push_back(parse_top_level_statement());
    }

    // delete iter;
    return program;
}
