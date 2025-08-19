#include <ctype.h>
#include <fstream>
#include <iostream>
#include <vector>
#include <tokenizer.hpp>

#define ARR_SIZE(x) (sizeof(x) / sizeof(char*))

// Who would've known that without regex
// This guy would be fairly complex?
// (not me)

// Infix stuff
const char* operators[] = {
    "+",
    "-",
    "*",
    "/",
    "<=",
    "<",
    ">",
    ">=",
    ":",
    "=", 
    "!=",
    "not",
    "and",
    "or",
    "xor"
};

const char* keyword[] = {
    "else",
    "fix",
    "in",
    "return",
    "syscall",
    "to",
    "update",
};

const char* statements[] = {
    "bind",
    "if",
    "print",
    "while",
};

// Just like the {} and () stuff
// Might add comas here
const char* punctuators[] = {
    "{",
    "}",
    "(",
    ")"
};


// Primitives
const char* types[] = {
    "->",
    "Boolean",
    "Character",
    "Integer",
    "String"
};

const char* whitespace[] = {
    " ",
    "\t",
    "\n"
};

const char* values[] = {
    "false",
    "lambda",
    "true",
};


bool string_in_array(const std::string tok, const char** arr, int arr_len) {
    for (int i = 0; i < arr_len; i++) {
        if (tok == arr[i]) {
            return true;
        }
    }
    return false;
};

bool is_integer(std::string tok) {
    for (int i = 0; i < tok.size(); i++) {
        if (!isdigit(tok.at(i)))
            return false;
    }
    return true;
} 

token_type determine_type(std::string tok) {
    // Having the manually set the size isn't ideal
    // If someone knows a better solution please tell me

    if (tok.size() == 0) {
        // TODO: Throw an error
        return UNKNOWN;
    }
    else if (string_in_array(tok, keyword, ARR_SIZE(keyword)))
        return KEYWORD;
    else if (string_in_array(tok, operators, ARR_SIZE(operators)))
        return OPERATOR;
    else if (string_in_array(tok, punctuators, ARR_SIZE(punctuators)))
        return PUNCTUATOR;
    else if (string_in_array(tok, statements, ARR_SIZE(statements))) {
        return STATEMENT;
    }
    else if (string_in_array(tok, types, ARR_SIZE(types)))
        return TYPE;
    else if (string_in_array(tok, values, ARR_SIZE(values)))
            return VALUE;
    else if (string_in_array(tok, whitespace, ARR_SIZE(whitespace)))
        return WHITESPACE;
    else if (is_integer(tok))
        return INTEGER;
    else if (!isalpha(tok.at(0)))
        return UNKNOWN;
    else 
        return IDENTIFIER;
}

// Debug function
void token_type_to_string(std::string& str, token_type ty) {
    switch (ty) {
        case IDENTIFIER:
            str = "IDENTIFIER";
            break;
        case INTEGER:
            str = "INTEGER";
            break;
        case KEYWORD:
            str = "KEYWORD";
            break;
        case OPERATOR:
            str = "OPERATOR";
            break;
        case PUNCTUATOR:
            str = "PUNCTUATOR";
            break;
        case WHITESPACE:
            str = "WHITESPACE";
            break;
        case STATEMENT:
            str = "STATEMENT";
            break;
        case TYPE:
            str = "TYPE";
            break;
        case VALUE: // Shouldn't be possible
        case UNKNOWN:
            str = "UNKNOWN";
            break;
        }
}

token get_token(std::string str, int start, int end, int line) {
    token t;
    t.value = str;
    t.type = determine_type(t.value);
    t.col_start = start;
    t.col_end = end;
    t.line = line;
    return t;
}

// If a variable can have "c" in its name
bool isacceptableident(char c) {
    return isalnum(c) || c == '_';
}

// If the character should stand alone
bool isterminal(char c) {
    std::string s;
    s = c;

    token_type ty = determine_type(s);
    return ty == PUNCTUATOR; // For now only tokens of this type
}

// When we've hit a whitespace
// This function gets called to toss tokens into the list
int add_tokens(std::vector<char> tokenizing, std::vector<token>& token_list, int col, int line) {
    int created = 0;
    int next_token_start = 0;
    for (int i = 0; i < tokenizing.size(); i++) {
        // Loop until we can no longer form an identifier
        // Like if we see print()
        // That left parenethesis means we no longer have an identifier
        if (!isacceptableident(tokenizing.at(i))) {
            if (next_token_start != i) {
                // Separate out the current token from the next
                std::string s(tokenizing.begin() + next_token_start, tokenizing.begin() + i);
                token_list.push_back(get_token(s, col, col + i, line));
                col += i;   
                created += 1;
            }

            int j = i + 1;
 
            // Some operators can be like "stacked" e.g. ->
            // Things like +-+- will still properly become unknown
            // Here we just check if we should start going forward
            // E.g. '(' doesn't but '-' does
            if (!isterminal(tokenizing.at(i))) {
                while (j < tokenizing.size() && !isacceptableident(tokenizing.at(j)))
                    j += 1;
            }

            // Parse thing that isn't an identifier/keyword
            std::string s(tokenizing.begin() + i, tokenizing.begin() + j);
            token separator = get_token(s, col, col + 1, line);
            token_list.push_back(separator);

            next_token_start = j;
            col += 1;
            i = j - 1;
            created += 1;
        }
    }

    if (next_token_start < tokenizing.size()) {
        std::string s(tokenizing.begin() + next_token_start, tokenizing.end());
        token_list.push_back(get_token(s, col, col + next_token_start, line));
        created += 1;
    }

    return created;
}

bool iswhitespace(char c) {
    std::string s;
    s = c;

    return determine_type(s) == WHITESPACE;
}

bool atcomment(std::vector<char> chars) {
    return chars.size() == 2 && chars.at(0) == '/' && chars.at(1) == '/';
}

int tokenize(std::ifstream& file, std::vector<token>& token_list) {
    std::vector<char> tokenizing;
    char curr;
    int tokens_created = 0;

    int start_col = 1;
    int line = 1;
    int add_col = 1;

    // Read in tokens until EOF or until we hit a non alphanumeric character
    while (file.get(curr)) {
        if (iswhitespace(curr)) {
            // We have hit a new token
            if (tokenizing.size() > 0) {
                tokens_created += add_tokens(tokenizing, token_list, start_col, line);
                tokenizing.clear();
                start_col += add_col;
            }

            if (curr == '\n') {
                start_col = 1;
                line += 1;
            }
            add_col = 1;
        }
        else {
            tokenizing.push_back(curr);
            if (atcomment(tokenizing)) {
                // Move to the next line
                tokenizing.clear();
                while (file.get(curr)) { // Doing an access and a set on one line is undefined behavior
                    if (curr == '\n') { // Hence me having this if to break
                        line += 1;
                        start_col = 1;
                        add_col = 1;
                        break;
                    }
                }
            }
            else {
                add_col += 1;
            }
        }
    }
    
    if (tokenizing.size() > 0) {
        tokens_created += add_tokens(tokenizing, token_list, start_col, line);
        tokenizing.clear();
    }

    return tokens_created;
}
