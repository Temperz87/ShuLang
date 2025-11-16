#include <ShuLangAST.hpp>
#include <cassert>
#include <iostream>
#include <iterator.hpp>
#include <memory>
#include <parser.hpp>
#include <set>
#include <string>
#include <tokenizer.hpp>
#include <unordered_map>
#include <vector>

using namespace shulang;

// Handwritten recursive descent parser
static Iterator<token> iter;
static token currenttoken;
static std::string filename;

const std::set<std::string> prefix_operators = {
    "not",
    "if"
};

// Map operators to their precedences
// Lower precendence implies parsed first and executed later
const std::unordered_map<std::string, int> operator_precedences = {
    {"+", 0},
    {"-", 0},
    {"*", 1},
    {"and", 2},
    {"or", 2},
    {"xor", 2},
    {"=", 3},
    {"!=", 3},
    {"<", 3},
    {"<=", 3},
    {">", 3},
    {">=", 3}
};

bool advance() {
    if (iter.empty())
        return false;

    iter.advance();
    
    // if (!iter.empty())
        // std::cout << "Iterator now at " << currenttoken.value << std::endl;
    // else
        // std::cout << "Iterator now empty" << std::endl;

    iter.get(currenttoken);
    return true;
}

void parse_error(std::string msg) {
    std::cout << msg << std::endl << "\tWhile at token " << currenttoken.value << std::endl << "At " << filename << ":" << currenttoken.line << ":" << currenttoken.col_start << std::endl; 
    exit(1);
}

void assert_strings_equal(std::string actual, std::string expected) {
    if (expected != actual) {
        parse_error("Expected \"" + expected + "\" but instead got " + actual);
    }
}

void assert_at_value(std::string expected) {
    assert_strings_equal(currenttoken.value, expected);
}

std::shared_ptr<ValueNode> parse_complex_value();
std::shared_ptr<StatementNode> parse_statement();

void parse_type(std::string& buf) {
    if (currenttoken.type != TYPE) {
        parse_error("Expected a type");
    }

    buf = "";
    while (currenttoken.type == TYPE) {
        // TODO: SOMETHING THAT ISNT AS EXPENSIVE AS CONCAT
        // This'll be important when we have (ty1 -> ty2) types
        // But for now here we are
        buf += currenttoken.value; 
        advance();
    }
}

// NOTE: This function has to be kept in sync with "parse_token_or_value"
std::shared_ptr<CallNode> parse_function_call(std::string identifier) {
    assert_strings_equal(currenttoken.value, "(");
    advance();
    std::shared_ptr<CallNode> ret = std::make_shared<CallNode>(identifier);
    while (currenttoken.value != ")") {
        std::shared_ptr<ValueNode> arg = parse_complex_value();
        ret->arguments.push_back(arg);
        if (currenttoken.value == ",") {
            advance();
        }
        else if (currenttoken.value != ")") {
            parse_error("Expected ',' or ')' while parsing call to function\n\t" + identifier);
        }
    }
    assert_strings_equal(currenttoken.value, ")");
    advance();
    return ret;
}

void parse_type_annot(std::string& buf) {
    assert_at_value(":");
    advance();
    parse_type(buf);
}

std::shared_ptr<ValueNode> parse_value() {
    std::shared_ptr<ValueNode> ret;
    switch (currenttoken.type){
        case INTEGER: {
            ret = std::make_shared<IntegerNode>(stoi(currenttoken.value));
            advance();
            break;
        }
        case VALUE: {
            if (currenttoken.value == "true")
                ret = std::make_shared<BooleanNode>(true);
            else if (currenttoken.value == "false")
                ret = std::make_shared<BooleanNode>(false);
            advance();
            break;
        }
        case IDENTIFIER: {
            std::string identifier = currenttoken.value;
            advance();
            if (currenttoken.value == "(")
                ret = parse_function_call(identifier);
            else
                ret = std::make_shared<VariableReferenceNode>(identifier);
            break;
        }
        case PUNCTUATOR: {
            if (currenttoken.value == "(") {
                advance();
                ret = parse_complex_value();
                assert_at_value(")");
                advance();
                break;
            }
        }
        case KEYWORD:
        case OPERATOR:
        case STATEMENT:
        case TYPE:
        case WHITESPACE:
        case UNKNOWN:
          parse_error("Expected a value (e.g. variable reference or integer)");
    }
    return ret;
}

std::shared_ptr<ValueNode> parse_prefix_operator() {
    if (currenttoken.value == "if") {
        advance();
        std::shared_ptr<ValueNode> condition = parse_complex_value();
        std::shared_ptr<ValueNode> then_value = parse_complex_value();
        std::shared_ptr<ValueNode> else_value = parse_complex_value();
        return std::make_shared<SelectOperatorNode>(condition, then_value, else_value);
    }
    else if (currenttoken.value == "not") {
        advance();
        std::shared_ptr<ValueNode> value = parse_complex_value();
        return std::make_shared<NotNode>(value);
    }
    else {
        parse_error("ShuC: You should not be able to see this. Please report \"prefix operator precedence bug\".");
        return nullptr;
    }
}

// Precedence climbing
std::shared_ptr<ValueNode> parse_operator(std::shared_ptr<ValueNode> lhs, int current_precedence) {
    while (operator_precedences.contains(currenttoken.value)) {
        std::string my_op = currenttoken.value;
        int precedence = operator_precedences.at(my_op);
        if (precedence < current_precedence)
            return lhs;
        else if (precedence > current_precedence) {
            lhs = parse_operator(lhs, precedence);
            continue;
        }
        advance();
        std::shared_ptr<ValueNode> rhs = parse_value();
        std::string op = currenttoken.value;
        if (!operator_precedences.contains(op)) {
            lhs = std::make_shared<OperatorApplicationNode>(my_op, lhs, rhs);
            break;
        }
        precedence = operator_precedences.at(op);
        while (precedence > current_precedence) {
            rhs = parse_operator(rhs, current_precedence + 1);
            op = currenttoken.value;
            if (!operator_precedences.contains(op))
                break;
            precedence = operator_precedences.at(op);
        }
        lhs = std::make_shared<OperatorApplicationNode>(my_op, lhs, rhs);
    }
    return lhs;
} 

std::shared_ptr<ValueNode> parse_complex_value() {
    std::shared_ptr<ValueNode> lhs = nullptr;
    if (currenttoken.type == OPERATOR || currenttoken.value == "if") {
        lhs = parse_prefix_operator();
    }
    else {
        lhs = parse_value();
    }
    if (currenttoken.type == OPERATOR) {
        return parse_operator(lhs, 0);
    }
    return lhs;
}

std::shared_ptr<BodyNode> parse_body() {
    std::shared_ptr<BodyNode> ret = std::make_shared<BodyNode>();
    if (currenttoken.value == "{") {
        advance();
        while (currenttoken.value != "}")
            ret->nodes.push_back(parse_statement());
        advance();
    }
    else {
        ret->nodes.push_back(parse_statement());
    }
    return ret;
}

std::shared_ptr<StatementNode> parse_statement() {
    if (currenttoken.value == "bind") {
        advance();
        std::string identifier;
        if (currenttoken.type != IDENTIFIER)
            parse_error("Expected a valid identifier");
        identifier = currenttoken.value;
        advance();
        std::string type;
        if (currenttoken.value == ":")
            parse_type_annot(type);
        else
            type = "Inferred";

        assert_strings_equal(currenttoken.value, "to");
        advance();
        std::shared_ptr<ValueNode> value = parse_complex_value();
        std::shared_ptr<BindingNode> bind = std::make_shared<BindingNode>(identifier, type, value);
        return bind;
    }
    else if (currenttoken.value == "if") {
        advance();
        std::shared_ptr<IfNode> ret = std::make_shared<IfNode>();
        std::shared_ptr<ValueNode> cond = parse_complex_value();
        ret->condition = std::make_shared<BeginNode>(cond);
        ret->then_block = parse_body();
        if (currenttoken.value == "else") {
            advance();
            ret->else_block = parse_body();
        }
        else {
            ret->else_block = nullptr;
        }
        return ret;
    }
    else if (currenttoken.value == "while") {
        advance();
        std::shared_ptr<WhileNode> ret = std::make_shared<WhileNode>();
        std::shared_ptr<ValueNode> cond = parse_complex_value();
        ret->condition = std::make_shared<BeginNode>(cond);
        ret->body = parse_body();
        return ret;
    }
    else if (currenttoken.type == IDENTIFIER) {
        std::string identifier = currenttoken.value;
        advance();
        return parse_function_call(identifier);
    }
    else {
        parse_error("Expected a statement");
    }

    return nullptr;
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
