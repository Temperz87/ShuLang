#pragma once

// #include <ShuIRAST.hpp>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Value.h>
#include <unordered_map>

namespace shuir {
    class ImmediateNode;
    class ReferenceNode;
    class AddNode;
    class SubNode;
    class MultNode;
    class DefinitionNode;
    class PrintNode;
    class ProgramNode;
    class SIRBlock;

    class LLVMCodegenVisitor {
        private:
            llvm::LLVMContext& context;
            llvm::IRBuilder<>* builder;
            llvm::Module* module;
            std::unordered_map<std::string, llvm::AllocaInst*> bindings;

        public:
            LLVMCodegenVisitor(llvm::LLVMContext& ctx,
                               llvm::IRBuilder<>* builder,
                               llvm::Module* module)
                               :context(ctx), builder(builder), module(module) { }

            llvm::Value* codegen(ImmediateNode* node);
            llvm::Value* codegen(ReferenceNode* node);
            llvm::Value* codegen(AddNode* node);
            llvm::Value* codegen(SubNode* node);
            llvm::Value* codegen(MultNode* node);
            llvm::Value* codegen(DefinitionNode* node);
            llvm::Value* codegen(PrintNode* node);
            llvm::Value* codegen(ProgramNode* node);

            void walk(SIRBlock block);
    };
}