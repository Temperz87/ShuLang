#pragma once

#include "ShuLangAST.hpp"
#include <memory>
#include "tokenizer.hpp"
#include <vector>

using namespace shulang;

// TODO: DOCUMENTATION
std::unique_ptr<ProgramNode> begin_parse(std::vector<token> tokenlist, std::string fileToParse);