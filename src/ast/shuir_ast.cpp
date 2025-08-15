#include "LLVMCodegenVisitor.hpp"
#include <ASTNode.hpp>
#include <ShuIRAST.hpp>
#include <llvm/IR/Value.h>
#include <string>
#include <vector>

using namespace shuir;

std::vector<std::string> SIRNode::get_usages() {
    return std::vector<std::string>();
}

std::vector<std::string> DefinitionNode::get_usages() {
    std::vector<std::string> other_usages = binding->get_usages();
    other_usages.insert(other_usages.begin(), this->identifier);
    return other_usages;
}

llvm::Value* DefinitionNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

llvm::Value* ImmediateNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

llvm::Value* ReferenceNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

std::vector<std::string> BinOpNode::get_usages() {
    std::vector<std::string> lhs_usage = lhs->get_usages();
    std::vector<std::string> rhs_usage = rhs->get_usages();
    lhs_usage.insert(lhs_usage.end(), rhs_usage.begin(), rhs_usage.end());
    return lhs_usage;
}

llvm::Value* AddNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

llvm::Value* SubNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

llvm::Value* MultNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

llvm::Value* CmpNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

std::vector<std::string> PhiNode::get_usages() {
    std::vector<std::string> usages;
    for (std::pair<std::string, ValueNode*> candidates: this->candidates) {
        // TODO: FIGURE OUT HOW TO ADD THIS IF IT'S A VARREF NODE
    }
    return usages;
}

llvm::Value* PhiNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

std::vector<std::string> PrintNode::get_usages() {
    return to_print->get_usages();
}

llvm::Value* PrintNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

std::vector<std::string> JumpNode::get_usages() {
    return std::vector<std::string>();
}

llvm::Value* JumpNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

std::vector<std::string> JumpIfElseNode::get_usages() {
    return condition->get_usages();
}

llvm::Value* JumpIfElseNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

SIRBlock::SIRBlock(std::string name) {
    this->name = name;
}

std::vector<std::string> ExitNode::get_usages() {
    return std::vector<std::string>();
}

llvm::Value* ExitNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

std::vector<std::string> ProgramNode::get_usages() {
    std::vector<std::string> ret;
    for (std::shared_ptr<SIRBlock> block : blocks) {
        for (std::shared_ptr<InstructionNode> node : block->instructions) {
            std::vector<std::string> usages = node->get_usages();
            ret.insert(ret.end(), usages.begin(), usages.end());
        }
    }
    return ret;
}

llvm::Value* ProgramNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}
