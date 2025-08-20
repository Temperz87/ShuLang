#pragma once

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/NoFolder.h>
#include <llvm/IR/Value.h>
#include <unordered_map>
#include <vector>

namespace sir {
    class ValueNode;
    class ImmediateNode;
    class ReferenceNode;
    class SelectNode;
    class AddNode;
    class SubNode;
    class MultNode;
    class CmpNode;
    class DefinitionNode;
    class PhiNode;
    class PrintNode;
    class JumpNode;
    class JumpIfElseNode;
    class ExitNode;
    class ProgramNode;
    class SIRBlock;

    class LLVMCodegenVisitor {
        private:
            llvm::LLVMContext& context;
            llvm::IRBuilder<llvm::NoFolder>* builder;
            llvm::Module* module;
            std::unordered_map<std::string, llvm::Value*> bindings;

            std::vector<std::pair<llvm::PHINode*, std::vector<std::pair<std::string, std::shared_ptr<ValueNode>>>>> redo_phi;

        public:
            std::unordered_map<std::string, llvm::BasicBlock*> blocks;
            
            LLVMCodegenVisitor(llvm::LLVMContext& ctx,
                               llvm::IRBuilder<llvm::NoFolder>* builder,
                               llvm::Module* module)
                               :context(ctx), builder(builder), module(module) { }

            llvm::Value* visit(ImmediateNode* node);
            llvm::Value* visit(ReferenceNode* node);
            llvm::Value* visit(SelectNode* node);
            llvm::Value* visit(AddNode* node);
            llvm::Value* visit(SubNode* node);
            llvm::Value* visit(MultNode* node);
            llvm::Value* visit(CmpNode* node);
            llvm::Value* visit(DefinitionNode* node);
            llvm::Value* visit(PhiNode* node);
            llvm::Value* visit(PrintNode* node);
            llvm::Value* visit(JumpNode* node);
            llvm::Value* visit(JumpIfElseNode* node);
            llvm::Value* visit(ExitNode* node);
            llvm::Value* visit(ProgramNode* node);

            void walk(SIRBlock* block);

            void fix_phi();
    };
}