#pragma once

#include "ShuLangAST.hpp"
#include <memory>
#include "tokenizer.hpp"
#include <vector>

// TODO: DOCUMENTATION
std::unique_ptr<shulang::ProgramNode> begin_parse(std::vector<token> tokenlist, std::string fileToParse);