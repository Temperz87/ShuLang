#pragma once

#include "ShuLangAST.hpp"
#include <ctype.h>
#include <iostream>
#include <string.h>
#include "tokenizer.hpp"
#include <vector>

using namespace shulang;

// TODO: DOCUMENTATION
ProgramNode* begin_parse(std::vector<token> tokenlist, std::string fileToParse);