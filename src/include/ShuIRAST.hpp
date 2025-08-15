#pragma once

#include <ASTNode.hpp>
#include <LLVMCodegenVisitor.hpp>
#include <llvm/IR/Value.h>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

namespace shuir {
    class SIRNode : public ASTNode {
        public:
            // I had this come up in an interview
            // So I'm pulling the yoink and twist on it
            // Thanks unnamed company :3
            virtual std::vector<std::string> get_usages();
            virtual llvm::Value* accept(LLVMCodegenVisitor* visitor) = 0;
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
    };

    class ReferenceNode : public ValueNode {
        public:
            std::string identifier;
            ReferenceNode(std::string identifier, int width):ValueNode(width), identifier(identifier) { };
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
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
    };

    class SubNode : public BinOpNode {
        public:
            SubNode():BinOpNode(32) { };
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class MultNode : public BinOpNode {
        public:
            MultNode():BinOpNode(32) { };
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class CmpNode : public BinOpNode {
        public:
            std::string op;
            CmpNode(std::string op):BinOpNode(1), op(op) { }
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
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
    };

    class PrintNode : public InstructionNode {
        public:
            std::shared_ptr<ValueNode> to_print;
            std::string print_type;
            PrintNode(std::shared_ptr<ValueNode> to_print, std::string print_type):
                to_print(to_print), print_type(print_type) { };
                
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class JumpNode : public InstructionNode {
        public:
            std::shared_ptr<SIRBlock> destination;
            JumpNode(std::shared_ptr<SIRBlock> destination):destination(destination) { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class JumpIfElseNode : public JumpNode {
        public:
            std::shared_ptr<SIRBlock> else_destination;
            std::shared_ptr<ValueNode> condition;
            JumpIfElseNode(std::shared_ptr<SIRBlock> destination, std::shared_ptr<SIRBlock> else_destination, std::shared_ptr<ValueNode> condition):JumpNode(destination), else_destination(else_destination), condition(condition) { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class PhiNode : public ValueNode {
        public:
            std::vector<std::pair<std::string, ValueNode*>> candidates;
            PhiNode(std::vector<std::pair<std::string, ValueNode*>> candidates, int width):ValueNode(width), candidates(candidates) { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class ExitNode : public InstructionNode {
        public:
            ExitNode() { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class SIRBlock {
        public:
            std::vector<std::shared_ptr<SIRBlock>> predecesors;
            std::unordered_map<std::string, std::shared_ptr<ReferenceNode>> variable_to_ref;
            std::vector<std::shared_ptr<InstructionNode>> instructions;
            std::string name;
            SIRBlock(std::string name);
    };

    class ProgramNode : public SIRNode {
        public:
            std::vector<std::shared_ptr<SIRBlock>> blocks;
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };
}