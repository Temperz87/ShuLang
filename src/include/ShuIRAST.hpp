#pragma once

#include <ASTNode.hpp>
#include <LLVMCodegenVisitor.hpp>
#include <llvm/IR/Value.h>
#include <string>
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

    class ValueNode : public SIRNode { };


    class ImmediateNode : public ValueNode {
        public:
            int number;
            ImmediateNode(int number):number(number) { };
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class ReferenceNode : public ValueNode {
        public:
            std::string identifier;
            ReferenceNode(std::string identifier);
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class BinOpNode : public ValueNode {
        public:
            std::shared_ptr<ValueNode> lhs;
            std::shared_ptr<ValueNode> rhs;
            std::vector<std::string> get_usages() override;
    };

    class AddNode : public BinOpNode {
        public:
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class SubNode : public BinOpNode {
        public:
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class MultNode : public BinOpNode {
        public:
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class CmpNode : public BinOpNode {
        public:
            std::string op;
            CmpNode(std::string op):op(op) { }
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class DefinitionNode : public InstructionNode {
        public:
            std::string identifier;
            std::shared_ptr<ValueNode> binding;
            DefinitionNode(std::string identifier, std::shared_ptr<ValueNode> binding):
                identifier(identifier), binding(binding) { };

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

    class JumpIfNode : public JumpNode {
        public:
            std::shared_ptr<ValueNode> condition;
            JumpIfNode(std::shared_ptr<SIRBlock> destination, std::shared_ptr<ValueNode> condition):JumpNode(destination), condition(condition) { }
            std::vector<std::string> get_usages() override;
            llvm::Value* accept(LLVMCodegenVisitor* visitor) override;
    };

    class SIRBlock {
        public:
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