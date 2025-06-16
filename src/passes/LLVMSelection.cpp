#include <iostream>
#include <ShuIRAST.hpp>
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
#include <memory>

using namespace shuir;

// TODO:
// PUT THIS IN ANOTHER FILE
// FOR THE LOVE OF GOD


llvm::Value* LLVMCodegenVisitor::codegen(ImmediateNode* node) {
    return llvm::ConstantInt::getSigned(llvm::Type::getInt32Ty(context), node->number);
}

llvm::Value* LLVMCodegenVisitor::codegen(ReferenceNode* node) {
    return builder->CreateLoad(llvm::Type::getInt32Ty(context), bindings.at(node->identifier), node->identifier);
}

llvm::Value* LLVMCodegenVisitor::codegen(AddNode* node) {
    return builder->CreateAdd(node->lhs->accept(this), node->rhs->accept(this));
}


llvm::Value* LLVMCodegenVisitor::codegen(DefinitionNode* node) {
    llvm::Value* bind_to = node->binding->accept(this);
    llvm::AllocaInst* fresh_binding = builder->CreateAlloca(llvm::Type::getInt32Ty(context), nullptr, node->identifier);
    this->bindings.insert({node->identifier, fresh_binding});
    return builder->CreateStore(bind_to, fresh_binding);
}


llvm::Value* LLVMCodegenVisitor::codegen(PrintNode* node) {
    llvm::Function* print_func = module->getFunction("printf");
    if (!print_func) {
        std::cout << "Could not find function printf" << std::endl;
    }

    std::vector<llvm::Value*> args;

    // load "%d\n"
    llvm::GlobalValue* format_global = module->getNamedValue("printf_integer_format");
    
    llvm::Value* index_field[2] = {llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 0),
                                llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 0)};

    llvm::Value* gimme_the_gep_gun = builder->CreateGEP(format_global->getValueType(), format_global, index_field);

    args.push_back(gimme_the_gep_gun);
    args.push_back(node->to_print->accept(this));

    return this->builder->CreateCall(module->getFunction("printf"), args);
}

llvm::Value* LLVMCodegenVisitor::codegen(ProgramNode* node) {
    return nullptr;
}

void LLVMCodegenVisitor::walk(SIRBlock block) {
    for (InstructionNode* node : block.instructions) {
        llvm::Value* val = node->accept(this);
        builder->Insert(val);
    }
}


// Now this should be in this file

void select_llvm_instructions(ProgramNode* node, std::string source_filename) {
    using namespace llvm;

    LLVMContext context;
    std::unique_ptr<IRBuilder<>> builder = std::make_unique<IRBuilder<>>(context);
    std::unique_ptr<Module> module = std::make_unique<Module>("Module", context);
    module->setSourceFileName(StringRef(source_filename));
    // Extern printf function
    FunctionType* printf_ty = FunctionType::get(Type::getInt32Ty(context), PointerType::get(Type::getInt8Ty(context), 0), true);
    Function::Create(printf_ty, Function::ExternalLinkage, "printf", module.get());
    // TODO: SET ARGUMENT NAMES

    // Add %d format
    builder->CreateGlobalString(StringRef("%d\n"), "printf_integer_format", 0, module.get());

    // Add main function
    FunctionType* main_ty = FunctionType::get(Type::getInt32Ty(context), false);
    Function* main_function = Function::Create(main_ty, Function::ExternalLinkage, "main", module.get());

    BasicBlock* entry_main = BasicBlock::Create(context, "entry", main_function);
    builder->SetInsertPoint(entry_main);
    LLVMCodegenVisitor visitor(context, builder.get(), module.get());
    for (SIRBlock block : node->blocks) {
        visitor.walk(block);
    }
    builder->CreateRet(ConstantInt::getSigned(Type::getInt32Ty(context), 0));
    verifyFunction(*main_function);

    module->print(errs(), nullptr);
}