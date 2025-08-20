#include <SIRAST.hpp>
#include <SIRCFG.hpp>
#include <LLVMCodegenVisitor.hpp>
#include "llvm/IR/IRBuilder.h"
#include <deque>
#include <iostream>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/Attributes.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalValue.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IR/NoFolder.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Alignment.h>
#include <llvm/Support/raw_ostream.h>
#include <system_error>
#include <unordered_set>

using namespace sir;

void select_llvm_instructions(ProgramNode* node, std::string source_filename, std::string output) {
    using namespace llvm;

    LLVMContext context;
    std::unique_ptr<IRBuilder<llvm::NoFolder>> builder = std::make_unique<IRBuilder<NoFolder>>(context);
    Module module("Module", context);
    module.setTargetTriple("x86_64-pc-linux-gnu");
    module.setSourceFileName(StringRef(source_filename));
    // Extern printf function
    FunctionType* printf_ty = FunctionType::get(Type::getInt32Ty(context), PointerType::get(Type::getInt8Ty(context), 0), true);
    Function::Create(printf_ty, Function::ExternalLinkage, "printf", module);
    // TODO: SET ARGUMENT NAMES

    // Add %d format
    builder->CreateGlobalString(StringRef("%d\n"), "printf_integer_format", 0, &module);
    // Add "true\n" format
    builder->CreateGlobalString(StringRef("true\n"), "printf_true_format", 0, &module);
    // Add "false\n" format
    builder->CreateGlobalString(StringRef("false\n"), "printf_false_format", 0, &module);

    // Add main function
    FunctionType* main_ty = FunctionType::get(Type::getInt32Ty(context), false);
    Function* main_function = Function::Create(main_ty, Function::ExternalLinkage, "main", module);
    main_function->addFnAttr(llvm::Attribute::NoUnwind);
    
    std::unique_ptr<LLVMCodegenVisitor> visitor = std::make_unique<LLVMCodegenVisitor>(context, builder.get(), &module);

    for (std::shared_ptr<SIRBlock> block : node->blocks) {
        BasicBlock* bb;
        if (block->name == "main") {
            bb = BasicBlock::Create(context, "entry", main_function);
        }
        else {
            bb = BasicBlock::Create(context, block->name, main_function);            
        }
        visitor->blocks.insert({block->name, bb});
    }

    // Add exit block
    // Notably adding this block the entry block
    // As if I don't entry doesn't get run first
    llvm::BasicBlock* bb = llvm::BasicBlock::Create(context, "exit", main_function);
    visitor->blocks.insert({"exit", bb});
    builder->SetInsertPoint(bb);
    builder->CreateRet(ConstantInt::getSigned(Type::getInt32Ty(context), 0));


    for (std::shared_ptr<SIRBlock> block : node->blocks) {
        builder->SetInsertPoint(visitor->blocks.at(block->name));
        visitor->walk(block.get());
    }
    visitor->fix_phi();

    verifyFunction(*main_function);

    // TODO: Check error code
    std::error_code code;
    raw_fd_ostream fd(output, code);
    module.print(fd, nullptr);
    fd.close();
}