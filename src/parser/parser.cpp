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
    if ((expected & currenttoken.type) != 0) {
        // TODO: Make error better
        // I need a way to go from enum to string
        parse_error("Unexpected token");
    }
}

std::shared_ptr<ValueNode> parse_complex_value();
std::shared_ptr<ValueNode> parse_low_prec_op(std::vector<token>& tokens, int start, int end);
std::shared_ptr<ValueNode> parse_high_prec_op(std::vector<token>& tokens, int start, int end);
std::shared_ptr<ValueNode> parse_integer_or_op(std::vector<token>& tokens, int start, int end);


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

std::shared_ptr<ValueNode> parse_value(token tok) {
    switch (tok.type){
        case INTEGER:
        return std::make_shared<IntegerNode>(IntegerNode(stoi(tok.value)));
        case VALUE:
            // TODO: PARSE EVERYTHING ELSE
            break;
        case IDENTIFIER:
            std::string ident = tok.value;
            return std::make_shared<VariableReferenceNode>(VariableReferenceNode(ident));
    }
    parse_error("Expected a value (e.g. variable reference or integer)");
    return nullptr;
}

// Operator mode should go like this
// 0. Enter this mode upon the first operator being found
// 1. Consume tokens until I see a statement (e.g. print)
// 2. Try to parse a low precedence operator, if I suceed try to parse another 
// 3. If I can't find a low precedence operator, parse a high precedence one
//      If I suceed to do this, parse a number
// 4. If I can't find either I forgot to declare oeprator precedence :(
// 5. Once an operator is parsed, determine left and right extents to parse next stuff
// 6. Parse next stuff

// TODO: parse assoc and validate that operators exist

std::shared_ptr<ValueNode> parse_high_prec_op(std::vector<token>& tokens, int start, int end) {
    // We're looking for a high precedence operator such as multiplication *
    std::string op;
    int i = start;
    for (i = start; i < end; i++) {
        if (tokens.at(i).value == "*") {
            op = tokens.at(i).value;
            break;
        }
    }

    if (i == end) {
        return parse_value(tokens.at(start));
    }

    std::shared_ptr<OperatorApplicationNode> ret = std::make_shared<OperatorApplicationNode>();
    ret->op = op;
    ret->lhs = parse_integer_or_op(tokens, start, i);
    ret->rhs = parse_integer_or_op(tokens, i + 1, end);
    return ret;
}

std::shared_ptr<ValueNode> parse_low_prec_op(std::vector<token>& tokens, int start, int end) {
    // We're looking for a low precedence operator such as +
    std::string op;
    int i = start;
    for (i = start; i < end; i++) {
        if (tokens.at(i).value == "(") {
            return parse_high_prec_op(tokens, start, end);
        }
        else if (tokens.at(i).value == "+" || tokens.at(i).value == "-") {
            // We know there isn't a parenthesis in the lhs
            // As if there was we that previous if statement would've fired
            op = tokens.at(i).value;
            break;
        }
    }
    if (i == end)
        return parse_high_prec_op(tokens, start, end);


    std::shared_ptr<OperatorApplicationNode> ret = std::make_shared<OperatorApplicationNode>();
    ret->op = op;
    ret->lhs = parse_integer_or_op(tokens, start, i);
    ret->rhs = parse_integer_or_op(tokens, i + 1, end);
    return ret;
}

std::shared_ptr<ValueNode> parse_integer_or_op(std::vector<token>& tokens, int start, int end) {
    if (end - start == 1) {
        return parse_value(tokens.at(start));
    }
    else if (tokens.at(start).value == "(" || tokens.at(start).value == ")") {
        return parse_integer_or_op(tokens, start + 1, end);
    }
    else 
        return parse_low_prec_op(tokens, start, end);
}

std::shared_ptr<ValueNode> parse_complex_value() {
    std::vector<token> tokens;
    token last_inserted;
    int scope = 1;
    if (currenttoken.value == "(")
        scope += 1;

    do {
        last_inserted = currenttoken;
        tokens.push_back(last_inserted);
        advance();
        if (currenttoken.type == PUNCTUATOR) {
            // Spahgetti code
            if (currenttoken.value == "(")
                scope += 1;
            else if (currenttoken.value == ")") {
                scope -= 1;
                if (scope == 0) {
                    break;
                }
            }
            else if (currenttoken.value == "{" || currenttoken.value == "}")
                parse_error("Unexpected token");
        }
        else if (last_inserted.type == OPERATOR && currenttoken.type == STATEMENT)
            parse_error("Expected an integer or value but instead got a statement");
        else if (last_inserted.type == (INTEGER | VALUE) && currenttoken.type == (INTEGER | VALUE))
            parse_error("There appears to be two values next to each other, I don't know what to do with this code");
    } while ((currenttoken.type & (OPERATOR | VALUE | INTEGER | IDENTIFIER | PUNCTUATOR)) != 0);
    
    if (scope > 1)
        parse_error("Unmatched '('");
    return parse_integer_or_op(tokens, 0, tokens.size());
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
