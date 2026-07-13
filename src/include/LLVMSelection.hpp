#pragma once

#include <llvm/IR/Module.h>
#include <memory>
#include <SIRAST.hpp>

std::unique_ptr<llvm::Module> select_llvm_instructions(sir::ProgramNode* node, std::string source_filename, llvm::LLVMContext& context);
