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

ReferenceNode::ReferenceNode(std::string identifier) {
    this->identifier = identifier;
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

std::vector<std::string> PrintNode::get_usages() {
    return to_print->get_usages();
}

llvm::Value* PrintNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}

SIRBlock::SIRBlock(std::string name) {
    this->name = name;
}

std::vector<std::string> ProgramNode::get_usages() {
    std::vector<std::string> ret;
    for (SIRBlock block : blocks) {
        for (std::shared_ptr<InstructionNode> node : block.instructions) {
            std::vector<std::string> usages = node->get_usages();
            ret.insert(ret.end(), usages.begin(), usages.end());
        }
    }
    return ret;
}

llvm::Value* ProgramNode::accept(LLVMCodegenVisitor* visitor) {
    return visitor->codegen(this);
}
