#pragma once

#include <ctype.h>
#include <fstream>
#include <iostream>
#include <string.h>
#include <vector>

enum token_type {
    IDENTIFIER = 1,
    VALUE = 2,
    INTEGER = 4,
    KEYWORD = 8,
    OPERATOR = 16,
    PUNCTUATOR = 32,
    STATEMENT = 64,
    TYPE = 128,
    WHITESPACE = 256,
    UNKNOWN = 512,
};

class token {
    public:
        token_type type;
        std::string value;
        int line;
        int col_start;
        int col_end;
};

// Takes in an input file and tosses a bunch of tokens in token_list
// The amount of tokens created
int tokenize(std::ifstream& file, std::vector<token>& token_list);

// Debug Function!!!
void token_type_to_string(std::string& str, token_type ty);
