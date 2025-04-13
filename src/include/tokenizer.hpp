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

// Takes in an input file and tosses a bunch of tokens in token_list
// The amount of tokens created
int tokenize(std::ifstream& file, std::vector<token*>& token_list);

void token_type_to_string(std::string& str, token_type ty);