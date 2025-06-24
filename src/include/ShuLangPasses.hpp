#pragma once

#include <ShuLangAST.hpp>
#include <ShuLangPasses.hpp>

using namespace shulang;

void uniquify(ProgramNode* program);
void remove_complex_operands(ProgramNode* program);
void short_circuitify(ProgramNode* program);