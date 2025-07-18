#include <ShuLangAST.hpp>
#include <cassert>
#include <iostream>
#include <iterator.hpp>
#include <memory>
#include <parser.hpp>
#include <string>
#include <tokenizer.hpp>
#include <vector>

// Handwritten recursive descent parser
static Iterator<token> iter;
static token currenttoken;
static std::string filename;

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

std::string operator_highest[] = {
    "=", 
    "!=",
    "<" ,
    "<=",
    ">",       
    ">="       
};

std::string operator_high[] = {
    "and",
    "or",
    "xor"      
};

std::string operator_medium[] = {
    "*"
};

std::string operator_low[] = {
        "+",
        "-"
};

int operator_len[] = {
    sizeof(operator_low) / sizeof(std::string),
    sizeof(operator_medium) / sizeof(std::string),
    sizeof(operator_high) / sizeof(std::string),
    sizeof(operator_highest) / sizeof(std::string)
};

std::string* operators[] {
    operator_low,
    operator_medium,
    operator_high,
    operator_highest
};

bool in_array(const std::string& str, int idx) {
    int len = operator_len[idx];
    std::string* ops = operators[idx];
    for (int i = 0; i < len; i++)
        if (ops[i] == str)
            return true;
    return false;
}


std::shared_ptr<ValueNode> parse_integer_or_op(std::vector<token>& tokens, int start, int end);
std::shared_ptr<ValueNode> parse_complex_value();
std::shared_ptr<StatementNode> parse_statement();

void parse_identifier(std::string& buf) {
    if (currenttoken.type != IDENTIFIER) {
        parse_error("This does not appear to be a valid identifier");
    }
    buf = currenttoken.value;
    advance();
}

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

void parse_type_annot(std::string& buf) {
    assert_at_value(":");
    advance();
    parse_type(buf);
}

std::shared_ptr<ValueNode> parse_value(token tok) {
    switch (tok.type){
        case INTEGER:
            return std::make_shared<IntegerNode>(stoi(tok.value));
        case VALUE:
            if (tok.value == "true")
                return std::make_shared<BooleanNode>(true);
            else if (tok.value == "false")
                return std::make_shared<BooleanNode>(false);
        case IDENTIFIER:
            std::string ident = tok.value;
            return std::make_shared<VariableReferenceNode>(ident);
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


// Assoc helper functions

// Given a token (
// Find its matching )
int get_closing_idx(std::vector<token>& tokens, int start, int end) {
    for (int i = start + 1; i < end; i++) {
        if (tokens.at(i).value == "(") {
            i = get_closing_idx(tokens, i, end);
        }
        else if (tokens.at(i).value == ")")
            return i;
    }
    return end;
}

// Given a token )
// Find its mactching (
int get_matching_open_idx(std::vector<token>& tokens, int start) {
    for (int i = start - 1; i > 1; i--) {
        if (tokens.at(i).value == ")") {
            i = get_matching_open_idx(tokens, i);
        }
        else if (tokens.at(i).value == "(")
            return i;
    }
    return 0;
}

// Consider: 1 + (2 * 3 + 4) + 5
// previous of 5 is +
// previous of + is )
// previous of ) is +
// previous of + is 1
int get_previous_atm_idx(std::vector<token>& tokens, int start) { 
    if (tokens.at(start).value == ")") {
        return get_matching_open_idx(tokens, start);
    }
    return start - 1;
}

std::shared_ptr<ValueNode> parse_ops(std::vector<token>& tokens, int start, int end) {
    // We're looking for a high precedence operator such as multiplication *
    int selected = -1;

    for (int operator_idx = 0; operator_idx < sizeof(operators) / sizeof(std::string*); operator_idx++) {
        for (int i = end - 1; i > start; i = get_previous_atm_idx(tokens, i)) {
            if (in_array(tokens.at(i).value, operator_idx)) {
                selected = i;
                break;
            }
        }

        if (selected != -1)
            break;
    }

    if (selected == -1) {
        return parse_value(tokens.at(start));
    }

    std::shared_ptr<OperatorApplicationNode> ret = std::make_shared<OperatorApplicationNode>();
    ret->op = tokens.at(selected).value;
    ret->lhs = parse_integer_or_op(tokens, start, selected);
    ret->rhs = parse_integer_or_op(tokens, selected + 1, end);
    return ret;
}

std::shared_ptr<ValueNode> parse_integer_or_op(std::vector<token>& tokens, int start, int end) {
    if (end - start == 1) {
        return parse_value(tokens.at(start));
    }
    else if (tokens.at(start).value == "(" && get_closing_idx(tokens, start, end) == end - 1)
        return parse_integer_or_op(tokens, start + 1, end - 1);
    else
        return parse_ops(tokens, start, end);
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
        if (!advance()) {
            parse_error("ShuC: Unexpected end of file. I think you recommend inserting a statement here");
        }
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
                break;
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

void parse_body(std::vector<std::shared_ptr<StatementNode>>& buf) {
    if (currenttoken.value == "{") {
        advance();
        while (currenttoken.value != "}")
            buf.push_back(parse_statement());
        advance();
    }
    else
        buf.push_back(parse_statement());
}

std::shared_ptr<StatementNode> parse_statement() {
    if (currenttoken.value == "bind") {
        advance();
        std::shared_ptr<BindingNode> b = std::make_shared<BindingNode>();
        parse_identifier(b->name);
        
        if (currenttoken.value == ":")
            parse_type_annot(b->ty);
        else
            b->ty = "Inferred";

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
    else if (currenttoken.value == "if") {
        advance();
        std::shared_ptr<IfNode> ret = std::make_shared<IfNode>();
        std::shared_ptr<ValueNode> cond = parse_complex_value();
        ret->condition = cond;
        parse_body(ret->then_block);

        if (currenttoken.value == "else") {
            advance();
            parse_body(ret->else_block);
        }
        
        return ret;
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
