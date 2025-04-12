#include <ctype.h>
#include <fstream>
#include <iostream>
#include <string.h>
#include <vector>

enum token_type {
    IDENTIFIER,
    INTEGER,
    KEYWORD,
    OPERATOR,
    PUNCTUATOR,
    WHITESPACE,
    TYPE,
    UNKNOWN
};

class token {
    public:
        token_type type;
        std::string value;
};


// Infix stuff
const char* operators[] = {
    "+",
    "-",
    "*",
    "/",
    "<=",
    "<",
    ">",
    ">="
};

const char* keywords[] = {
    "and",
    "bind",
    "else",
    "equals", 
    "not",
    "nequals",
    "fix",
    "if",
    "in",
    "lambda",
    "or"
    "print",
    "return",
    "syscall",
    "to",
    "update",
    "while"
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
    ":",
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
    // TODO: MAKE THIS LOOK BETTER
    // TODO: WHAT IF STIRNG SIZE IS ZERO???
    if (string_in_array(tok, operators, 8))
        return OPERATOR;
    else if (string_in_array(tok, keywords, 16))
        return KEYWORD;
    else if (string_in_array(tok, punctuators, 4))
        return PUNCTUATOR;
    else if (string_in_array(tok, types, 6))
        return TYPE;
    else if (string_in_array(tok, whitespace, 3))
        return WHITESPACE;
    else if (is_integer(tok))
        return INTEGER;
    else if (!isalpha(tok.at(0)))
        return UNKNOWN;
    else 
        return IDENTIFIER;
}

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
        case TYPE:
            str = "TYPE";
            break;
        case UNKNOWN:
            str = "UNKNOWN";
            break;
    }
}

token* get_token(std::string str) {
    token* t = new token;
    t->value = str;
    t->type = determine_type(t->value);
    return t;
}

bool isacceptableident(char c) {
    return isalnum(c) || c == '_';
}

bool isterminal(char c) {
    std::string s;
    s = c;

    token_type ty = determine_type(s);
    return ty == PUNCTUATOR;
}

int add_tokens(std::vector<char> tokenizing, std::vector<token*>& token_list) {
    if (tokenizing.size() == 0) {
        // TODO: ERROR
        return 0;
    }

    int created = 0;

    int next_token_start = 0;
    for (int i = 0; i < tokenizing.size(); i++) {
        if (!isacceptableident(tokenizing.at(i))) {
            if (next_token_start != i) {
                std::string s(tokenizing.begin() + next_token_start, tokenizing.begin() + i);
                token_list.push_back(get_token(s));
                created += 1;
            }

            int j = i + 1;
 
            if (!isterminal(tokenizing.at(i))) {
                while (j < tokenizing.size() && !isacceptableident(tokenizing.at(j)))
                    j += 1;
            }

            std::string s(tokenizing.begin() + i, tokenizing.begin() + j);
            if (j != i + 1) {
                // std::cout << s << std::endl;
            }
            token* separator = get_token(s);
            token_list.push_back(separator);

            next_token_start = j;
            i = j - 1;
            created += 1;
        }
    }

    if (next_token_start < tokenizing.size()) {
        std::string s(tokenizing.begin() + next_token_start, tokenizing.end());
        token_list.push_back(get_token(s));
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

int tokenize(std::ifstream& file, std::vector<token*>& token_list) {
    std::vector<char> tokenizing;
    char curr;
    int tokens_created = 0;

    // Read in tokens until EOF or until we hit a non alphanumeric character
    while (file.get(curr)) {
        if (iswhitespace(curr)) {
            // We have hit a new token
            if (tokenizing.size() > 0) {
                tokens_created += add_tokens(tokenizing, token_list);
                tokenizing.clear();
            }
        }
        else {
            tokenizing.push_back(curr);
            if (atcomment(tokenizing)) {
                tokenizing.clear();
                while (file.get(curr))
                    if (curr == '\n')
                        break;
            }
        }
    }

    // TODO: WHAT IF TOKENIZING ISN'T EMPTY??
    return tokens_created;
}

// TODO: Remove the main method
int main(int argc, char** argv) {
    if (argc != 2)
        std::cout << "Expected 1 argument but got " << argc - 1 << " arguments instead" << std::endl;

    std::ifstream myfile;
    myfile.open(argv[1]);
    if (!myfile.is_open()) {
        std::cout << "Error opening file " << argv[1] << std::endl;
        return -1;
    }

    std::vector<token*> token_list;
    int tokens = tokenize(myfile, token_list);


    for (int i = 0; i < tokens; i++) {
        token* t = token_list.at(i);
        std::string ty;
        token_type_to_string(ty, t->type);
        std::cout << "(" << t->value << ", " << ty << ")" << std::endl;
        delete t;
    }

    myfile.close();
    return 0;
}