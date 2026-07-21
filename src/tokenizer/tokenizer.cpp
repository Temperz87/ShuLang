#include <ctype.h>
#include <fstream>
#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <tokenizer.hpp>

// Dictionary mapping string literals to their token types
const std::unordered_map<std::string_view, token_type> token_types = {
    // Infix operators
    {"+",  OPERATOR},
    {"-",  OPERATOR},
    {"*",  OPERATOR},
    {"/",  OPERATOR},
    {"<=", OPERATOR},
    {"<",  OPERATOR},
    {">",  OPERATOR},
    {">=", OPERATOR},
    {":",  OPERATOR},
    {"=",  OPERATOR},
    {"!=", OPERATOR},
    {"not", OPERATOR},
    {"and", OPERATOR},
    {"or",  OPERATOR},
    {"xor", OPERATOR},

    // ShuLang reserved words
    {"else",   KEYWORD},
    {"fix",    KEYWORD},
    {"in",     KEYWORD},
    {"return", KEYWORD},
    {"to",     KEYWORD},

    // Top level statements
    {"bind",  STATEMENT},
    {"if",    STATEMENT},
    {"while", STATEMENT},

    // Punctuators
    {"{", PUNCTUATOR},
    {"}", PUNCTUATOR},
    {"(", PUNCTUATOR},
    {")", PUNCTUATOR},

    // Value types
    {"->",        TYPE},
    {"Boolean",   TYPE},
    {"Character", TYPE},
    {"Integer",   TYPE},
    {"String",    TYPE},

    // Values
    {"false",  VALUE},
    {"lambda", VALUE},
    {"true",   VALUE},
};

// Whitespace is checked character-by-character rather than looked up
// as a "type" of token, so it stays a plain set.
const std::unordered_set<std::string_view> whitespace = {
    " ",
    "\t",
    "\n"
};

bool is_integer(const std::string& tok) {
    for (int i = 0; i < tok.size(); i++) {
        if (!isdigit(tok.at(i)))
            return false;
    }
    return true;
} 

token_type determine_type(const std::string& tok) {
    if (tok.empty()) {
        std::cout << "ShuC: Unexpected end of file" << std::endl;
        exit(1);
    }

    auto it = token_types.find(tok);
    if (it != token_types.end())
        return it->second;
    if (whitespace.contains(tok))
        return WHITESPACE;
    if (is_integer(tok))
        return INTEGER;
    if (!std::isalpha(static_cast<unsigned char>(tok[0])))
        return UNKNOWN;

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

token get_token(const std::string& str, int start, int end, int line) {
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
int add_tokens(const std::vector<char>& tokenizing, std::vector<token>& token_list, int col, int line) {
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

inline bool iswhitespace(char c) {
    return whitespace.contains(std::string(1, c));
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
