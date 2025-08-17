#pragma once

#include "SIRVisitor.hpp"
#include <ASTNode.hpp>
#include <LLVMCodegenVisitor.hpp>
#include <llvm/IR/Value.h>
#include <memory>
#include <string>
#include <unordered_set>
#include <vector>

namespace shuir {
    class SIRNode : public ASTNode {
        public:
            // I had this come up in an interview
            // So I'm pulling the yoink and twist on it
            // Thanks unnamed company :3
            virtual std::vector<std::string> get_usages();
            virtual llvm::Value* accept(LLVMCodegenVisitor* visitor) = 0;
            virtual void accept(SIRVisitor* visitor) = 0;
    };

    class InstructionNode : public SIRNode { };

    class ValueNode : public SIRNode { 
        public:
            // For now everything is a number
            // So the "type" is just the bitwidth of said number
            int width;
            ValueNode(int width):width(width) { }
    };


    class ImmediateNode : public ValueNode {
        public:
            int number;
            ImmediateNode(int number, int width):ValueNode(width), number(number) { };
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class ReferenceNode : public ValueNode {
        public:
            std::string identifier;
            ReferenceNode(std::string identifier, int width):ValueNode(width), identifier(identifier) { };
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class BinOpNode : public ValueNode {
        public:
            std::shared_ptr<ValueNode> lhs;
            std::shared_ptr<ValueNode> rhs;
            BinOpNode(int width):ValueNode(width) { };
            std::vector<std::string> get_usages() override;
    };

    class AddNode : public BinOpNode {
        public:
            AddNode():BinOpNode(32) { };
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class SubNode : public BinOpNode {
        public:
            SubNode():BinOpNode(32) { };
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class MultNode : public BinOpNode {
        public:
            MultNode():BinOpNode(32) { };
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class CmpNode : public BinOpNode {
        public:
            std::string op;
            CmpNode(std::string op):BinOpNode(1), op(op) { }
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class DefinitionNode : public InstructionNode {
        public:
            std::string identifier;
            std::shared_ptr<ValueNode> binding;
            int width;
            DefinitionNode(std::string identifier, std::shared_ptr<ValueNode> binding):
                identifier(identifier), binding(binding), width(binding->width) { };

            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class PrintNode : public InstructionNode {
        public:
            std::shared_ptr<ValueNode> to_print;
            std::string print_type;
            PrintNode(std::shared_ptr<ValueNode> to_print, std::string print_type):
                to_print(to_print), print_type(print_type) { };
                
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class JumpNode : public InstructionNode {
        public:
            std::shared_ptr<SIRBlock> destination;
            JumpNode(std::shared_ptr<SIRBlock> destination):destination(destination) { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class JumpIfElseNode : public JumpNode {
        public:
            std::shared_ptr<SIRBlock> else_destination;
            std::shared_ptr<ValueNode> condition;
            JumpIfElseNode(std::shared_ptr<SIRBlock> destination, std::shared_ptr<SIRBlock> else_destination, std::shared_ptr<ValueNode> condition):JumpNode(destination), else_destination(else_destination), condition(condition) { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class PseudoPhiNode : public ValueNode {
        public:
            std::string requested_previous;
            PseudoPhiNode(std::string previous, int width):ValueNode(width), requested_previous(previous) { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class PhiNode : public ValueNode {
        public:
            std::vector<std::pair<std::string, std::shared_ptr<ValueNode>>> candidates;
            PhiNode(std::vector<std::pair<std::string, std::shared_ptr<ValueNode>>> candidates, int width):ValueNode(width), candidates(candidates) { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    class ExitNode : public InstructionNode {
        public:
            ExitNode() { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };

    // TODO: There's potentially undefined behavior here
    class SIRBlock {
        public:
            std::unordered_set<std::shared_ptr<SIRBlock>> predecesors;
            // Maintain a shared_ptr because the map "owns" this
            // TODO: Make this an unique_ptr
            std::unordered_map<std::string, std::string> variable_to_ref;
            std::vector<std::shared_ptr<InstructionNode>> instructions;
            std::string name;
            bool is_terminal = false;
            SIRBlock(std::string name);
    };

    class ProgramNode : public SIRNode {
        public:
            std::vector<std::shared_ptr<SIRBlock>> blocks;
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
            void accept(SIRVisitor* visitor) override {  visitor->visit(this); };
    };
}