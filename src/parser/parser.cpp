#include <ctype.h>
#include <iostream>
#include <iterator.hpp>
#include <string.h>
#include <tokenizer.hpp>
#include <vector>

// Handwritten recursive descent parser
Iterator<token>* iter;
static token currenttoken;

void advance() {
    iter->advance();
    iter->get(currenttoken);
}


// TODO: RETURN AN AST!!!
void begin_parse(std::vector<token>& tokenlist, int tokens) {
    iter = new Iterator<token>(tokenlist, tokens);
}
