#include <AST.hpp>
#include <ctype.h>
#include <iostream>
#include <iterator.hpp>
#include <parser.hpp>
#include <string.h>
#include <tokenizer.hpp>
#include <vector>

// Handwritten recursive descent parser
Iterator<token>* iter;
static token currenttoken;

void advance() {
    iter->advance();
    
    // if (!iter->empty())
    //     std::cout << "Iterator now at " << currenttoken.value << std::endl;
    // else
    //     std::cout << "Iterator empty" << std::endl;

    iter->get(currenttoken);
}

void assertstringsequal(std::string expected, std::string actual) {
    if (expected != actual) {
        // TODO: ERROR
    }
}

void parse_identifier(std::string& buf) {
    if (currenttoken.type != IDENTIFIER) {
        // TOOD: ERROR
    }
    buf = currenttoken.value;
}

void parse_type(std::string& buf) {
    if (currenttoken.type != TYPE) {
        // TODO: ERROR
    }

    buf = "";
    while (currenttoken.type == TYPE) {
        buf += currenttoken.value; // TODO: SOMETHING THAT ISNT AS EXPENSIVE AS CONCAT
        advance();
    }
}

void parse_type_annot(std::string& buf) {
    assertstringsequal(buf, ":");
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
}

StatementNode* parse_statement() {
    if (currenttoken.value == "bind") {
        advance();
        BindingNode* b = new BindingNode();
        parse_identifier(b->name);
        advance();
        parse_type_annot(b->ty);
        assertstringsequal(currenttoken.value, "to");
        advance();
        b->value = parse_value();
        return b;
    }
    else if (currenttoken.value == "print") {
        advance();
        assertstringsequal(currenttoken.value, "(");
        advance();
        ValueNode* toPrint = parse_value();
        assertstringsequal(currenttoken.value, ")");
        advance();
        return new PrintNode(toPrint);
    }

    // TODO: ERROR
}

StatementNode* parse_top_level_statement() {
    StatementNode* ret = new StatementNode();
    switch (currenttoken.type) {
        case STATEMENT:
            ret = parse_statement();
            return ret;
        case PUNCTUATOR:
            if (currenttoken.value != "(") {
                // TOOD: PARSE ERROR
            }
            break;
        default:
            // TODO: Parse Error
            std::cout << "I did not expect " << currenttoken.value << " as a top level statement." << std::endl;
    }
}


// TODO: RETURN AN AST!!!
ProgramNode* begin_parse(std::vector<token>* tokenlist) {
    iter = new Iterator<token>(tokenlist);
    iter->get(currenttoken);
    
    ProgramNode* program = new ProgramNode();


    while (!iter->empty()) {
        program->nodes.push_back(parse_top_level_statement());
    }
    delete iter;

    return program;
}
