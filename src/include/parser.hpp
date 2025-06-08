#pragma once

#include "AST.hpp"
#include <ctype.h>
#include <iostream>
#include <string.h>
#include "tokenizer.hpp"
#include <vector>

// TODO: DOCUMENTATION
ProgramNode* begin_parse(std::vector<token>* tokenlist, std::string fileToParse);