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
    std::cout << "Advancing" << std::endl;
    iter->advance();
    
    if (!iter->empty())
        std::cout << "Iterator now at " << currenttoken.value << std::endl;
    else
        std::cout << "Iterator empty" << std::endl;

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
    std::cout << "ident: " << currenttoken.value << std::endl;
    buf = currenttoken.value;
}

void parse_type(std::string& buf) {
    if (currenttoken.type != TYPE) {
        // TODO: ERROR
    }

    buf = "";
    while (currenttoken.type == TYPE) {
        std::cout << "Type " << currenttoken.value << std::endl; 
        buf += currenttoken.value; // TODO: SOMETHING THAT ISNT AS EXPENSIVE AS CONCAT
        advance();
    }
}

void parse_type_annot(std::string& buf) {
    assertstringsequal(buf, ":");
    std::cout << "Type annot " << currenttoken.value << std::endl; 
    advance();
    parse_type(buf);
}

IntegerNode parse_integer() {
    token mytoken = currenttoken;
    advance();
    return IntegerNode(stoi(mytoken.value));
}

ValueNode parse_value() {
    switch (currenttoken.type){
        case INTEGER:
            return parse_integer();
        case VALUE:
            // TODO: PARSE EVERYTHING ELSE
            break;
        case IDENTIFIER:
            std::string ident = currenttoken.value;
            advance();
            return VariableReferenceNode(ident);
    }
    // TODO: ERROR
}

StatementNode parse_statement() {
    if (currenttoken.value == "bind") {
        std::cout << "Parsing bind" << std::endl;
        advance();
        BindingNode b;
        parse_identifier(b.name);
        advance();
        parse_type_annot(b.ty);
        assertstringsequal(currenttoken.value, "to");
        std::cout << "To " << currenttoken.value << std::endl; 
        advance();
        b.value = parse_value();
        std::cout << "Value doan!!!" << std::endl;
        return b;
    }
    else if (currenttoken.value == "print") {
        advance();
        assertstringsequal(currenttoken.value, "(");
        advance();
        ValueNode toPrint = parse_value();
        assertstringsequal(currenttoken.value, ")");
        advance();
        return PrintNode(toPrint);
    }

    // TODO: ERROR
}

ASTNode parse_top_level_statement() {
    StatementNode ret;
    switch (currenttoken.type) {
        case STATEMENT:
            std::cout << "At stmt: " << currenttoken.value << std::endl;
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
ProgramNode begin_parse(std::vector<token>* tokenlist) {
    iter = new Iterator<token>(tokenlist);
    iter->get(currenttoken);
    
    ProgramNode program;


    while (!iter->empty()) {
        program.nodes.push_back(parse_top_level_statement());
    }
    std::cout << "Iterator is empty!!!" << std::endl;
    delete iter;

    return program;
}
