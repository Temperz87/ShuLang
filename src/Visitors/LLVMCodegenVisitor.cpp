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

using namespace shuir;

llvm::Value* LLVMCodegenVisitor::codegen(ImmediateNode* node) {
    return llvm::ConstantInt::getSigned(llvm::Type::getInt32Ty(context), node->number);
}

llvm::Value* LLVMCodegenVisitor::codegen(ReferenceNode* node) {
    return builder->CreateLoad(llvm::Type::getInt32Ty(context), bindings.at(node->identifier), node->identifier);
}

llvm::Value* LLVMCodegenVisitor::codegen(AddNode* node) {
    return builder->CreateAdd(node->lhs->accept(this), node->rhs->accept(this));
}

llvm::Value* LLVMCodegenVisitor::codegen(SubNode* node) {
    return builder->CreateSub(node->lhs->accept(this), node->rhs->accept(this));
}

llvm::Value* LLVMCodegenVisitor::codegen(MultNode* node) {
    return builder->CreateMul(node->lhs->accept(this), node->rhs->accept(this));
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

    // ...what
    llvm::Value* index_field[2] = {llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 0),
                                   llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 0)};

    // llvm optimizes this out??????????
    // WHAT????
    // I CAN EXPLAIN EVERY OTHER LINE
    // NOT THIS ONE THOUGH!!!
    llvm::Value* gimme_the_gep_gun = builder->CreateGEP(format_global->getValueType(), format_global, index_field); // Deus Ex Machina reference please laugh
    args.push_back(gimme_the_gep_gun);
    args.push_back(node->to_print->accept(this));

    return this->builder->CreateCall(module->getFunction("printf"), args);
}

// Yeah I can probably delete this
// But save it for the intermission
llvm::Value* LLVMCodegenVisitor::codegen(ProgramNode* node) {
    return nullptr;
}

void LLVMCodegenVisitor::walk(SIRBlock block) {
    for (std::shared_ptr<InstructionNode> node : block.instructions) {
        node->accept(this);
    }
}
