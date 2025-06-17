#include <ShuIRAST.hpp>
#include <LLVMCodegenVisitor.hpp>
#include "llvm/IR/IRBuilder.h"
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalValue.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Alignment.h>
#include <llvm/Support/raw_ostream.h>
#include <system_error>


using namespace shuir;

void select_llvm_instructions(ProgramNode* node, std::string source_filename, std::string output) {
    using namespace llvm;

    LLVMContext context;
    std::unique_ptr<IRBuilder<>> builder = std::make_unique<IRBuilder<>>(context);
    Module module("Module", context);
    module.setSourceFileName(StringRef(source_filename));
    // Extern printf function
    FunctionType* printf_ty = FunctionType::get(Type::getInt32Ty(context), PointerType::get(Type::getInt8Ty(context), 0), true);
    Function::Create(printf_ty, Function::ExternalLinkage, "printf", module);
    // TODO: SET ARGUMENT NAMES

    // Add %d format
    builder->CreateGlobalString(StringRef("%d\n"), "printf_integer_format", 0, &module);

    // Add main function
    FunctionType* main_ty = FunctionType::get(Type::getInt32Ty(context), false);
    Function* main_function = Function::Create(main_ty, Function::ExternalLinkage, "main", module);

    BasicBlock* entry_main = BasicBlock::Create(context, "entry", main_function);
    builder->SetInsertPoint(entry_main);
    std::unique_ptr<LLVMCodegenVisitor> visitor = std::make_unique<LLVMCodegenVisitor>(context, builder.get(), &module);
    for (SIRBlock block : node->blocks) {
        visitor->walk(block);
    }
    builder->CreateRet(ConstantInt::getSigned(Type::getInt32Ty(context), 0));
    verifyFunction(*main_function);

    // TODO: Check error code
    std::error_code code;
    raw_fd_ostream fd(output, code);
    module.print(fd, nullptr);
    fd.close();
}