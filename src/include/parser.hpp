#include <ShuLangAST.hpp>
#include <memory>
#include <tokenizer.hpp>
#include <vector>

// Given a list of tokens, and a source file name for error message purposes, produce a ShuLang AST
std::unique_ptr<shulang::ProgramNode> begin_parse(std::vector<token>& tokenlist, const std::string& fileToParse);
