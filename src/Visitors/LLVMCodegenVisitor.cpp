#include "LLVMCodegenVisitor.hpp"
#include <iostream>
#include <SIRAST.hpp>
#include "llvm/IR/IRBuilder.h"
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalValue.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Metadata.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Alignment.h>

using namespace sir;

llvm::Value* LLVMCodegenVisitor::visit(ImmediateNode* node) {
    llvm::IntegerType* ty = llvm::Type::getIntNTy(context, node->width);
    return llvm::ConstantInt::getSigned(ty, node->number);
}

llvm::Value* LLVMCodegenVisitor::visit(ReferenceNode* node) {
    return bindings.at(node->identifier);
    // return builder->CreateLoad(llvm::Type::getIntNTy(context, node->width), bindings.at(node->identifier), node->identifier);
}

llvm::Value* LLVMCodegenVisitor::visit(SelectNode* node) {
    return builder->CreateSelect(node->condition->accept(this), node->true_value->accept(this), node->false_value->accept(this));
}

llvm::Value* LLVMCodegenVisitor::visit(AddNode* node) {
    return builder->CreateAdd(node->lhs->accept(this), node->rhs->accept(this));
}

llvm::Value* LLVMCodegenVisitor::visit(SubNode* node) {
    return builder->CreateSub(node->lhs->accept(this), node->rhs->accept(this));
}

llvm::Value* LLVMCodegenVisitor::visit(MultNode* node) {
    return builder->CreateMul(node->lhs->accept(this), node->rhs->accept(this));
}

llvm::CmpInst::Predicate get_predicate(std::string op) {
    if (op == "<") 
        return llvm::CmpInst::Predicate::ICMP_SLT;
    else if (op == "<=")
        return llvm::CmpInst::Predicate::ICMP_SLE;
    else if (op == ">")
        return llvm::CmpInst::Predicate::ICMP_SGT;
    else if (op == ">=")
        return llvm::CmpInst::Predicate::ICMP_SGE;
    else if (op == "=")
        return llvm::CmpInst::Predicate::ICMP_EQ;
    else if (op == "!=" || op == "xor")
        return llvm::CmpInst::Predicate::ICMP_NE;
    return llvm::CmpInst::Predicate::BAD_ICMP_PREDICATE;
}

llvm::Value* LLVMCodegenVisitor::visit(CmpNode* node) {
    llvm::Value* lhs = node->lhs->accept(this);
    llvm::Value* rhs = node->rhs->accept(this);

    if (node->op == "and")
        return builder->CreateLogicalAnd(lhs, rhs);
    else if (node->op == "or")
        return builder->CreateLogicalOr(lhs, rhs);
    return builder->CreateICmp(get_predicate(node->op), lhs, rhs);
}

llvm::Value* LLVMCodegenVisitor::visit(PhiNode* node) {
    llvm::PHINode* phi = builder->CreatePHI(llvm::Type::getIntNTy(context, node->width), node->candidates.size());
    // for (std::pair<std::string, std::shared_ptr<ValueNode>> candidate : node->candidates) {
        // phi->addIncoming(candidate.second->accept(this), blocks.at(candidate.first));
    // }
    redo_phi.push_back({phi, node->candidates});
    return phi;
}

llvm::Value* LLVMCodegenVisitor::visit(JumpNode* node) {
    llvm::BasicBlock* dest_bb = blocks.at(node->destination->name);
    return builder->CreateBr(dest_bb);
}

llvm::Value* LLVMCodegenVisitor::visit(JumpIfElseNode* node) {
    llvm::BasicBlock* then_bb = blocks.at(node->destination->name);
    llvm::BasicBlock* else_bb = blocks.at(node->else_destination->name);

    llvm::Value* condition = node->condition->accept(this);
    return builder->CreateCondBr(condition, then_bb, else_bb);
}

llvm::Value* LLVMCodegenVisitor::visit(DefinitionNode* node) {
    llvm::Value* bind_to = node->binding->accept(this);
    // llvm::AllocaInst* binding;
    // if (!this->bindings.contains(node->identifier)) {
        // binding = builder->CreateAlloca(bind_to->getType(), nullptr, node->identifier);
    // }
    // else {
        // binding = this->bindings.at(node->identifier);
    // }

    this->bindings.insert({node->identifier, bind_to});
    // return builder->CreateStore(bind_to, bind_to);
    return bind_to;
}

llvm::Value* LLVMCodegenVisitor::visit(PrintNode* node) {
    llvm::Function* print_func = module->getFunction("printf");
    if (!print_func) {
        std::cout << "Could not find function printf" << std::endl;
    }

    std::vector<llvm::Value*> args;
    llvm::Value* to_print = node->to_print->accept(this);
    
    if (node->print_type == "Integer") {
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
        args.push_back(to_print);
    }
    else if (node->print_type == "Boolean") {
        llvm::Value* select = builder->CreateSelect(to_print, module->getNamedValue("printf_true_format"), module->getNamedValue("printf_false_format"));
        args.push_back(select);
    }
    else {
        std::cout << "Unsupported print type: " << node->print_type << std::endl;
        exit(2);
    }
    return this->builder->CreateCall(module->getFunction("printf"), args);
}

llvm::Value* LLVMCodegenVisitor::visit(InputNode* node) {
    llvm::Function* print_func = module->getFunction("scanf");
    if (!print_func) {
        std::cout << "Could not find function scanf" << std::endl;
        return nullptr;
    }
    llvm::Value* ptr = this->builder->CreateAlloca(llvm::PointerType::getInt32Ty(context));
    std::vector<llvm::Value*> args;

    // %d\n
    llvm::GlobalValue* format_global = module->getNamedValue("printf_integer_format"); // Same format!
    
    // ...what
    llvm::Value* index_field[2] = {llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 0),
                                llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 0)};
    llvm::Value* gimme_the_gep_gun = builder->CreateGEP(format_global->getValueType(), format_global, index_field); // Deus Ex Machina reference please laugh
    args.push_back(gimme_the_gep_gun);
    args.push_back(ptr);
    this->builder->CreateCall(module->getFunction("scanf"), args);
    return this->builder->CreateLoad(llvm::Type::getInt32Ty(context), ptr);
}

llvm::Value* LLVMCodegenVisitor::visit(ExitNode* node) {
    return this->builder->CreateBr(blocks.at("exit"));
}

// Yeah I can probably delete this
// But save it for the intermission
llvm::Value* LLVMCodegenVisitor::visit(ProgramNode* node) {
    return nullptr;
}

void LLVMCodegenVisitor::walk(SIRBlock* block) {
    for (std::shared_ptr<InstructionNode> node : block->instructions) {
        node->accept(this);
    }
}

void LLVMCodegenVisitor::fix_phi() {
    for (auto long_pair : redo_phi) {
        llvm::PHINode* phi = long_pair.first;
        for (std::pair<std::string, std::shared_ptr<ValueNode>> candidate : long_pair.second) {
            phi->addIncoming(candidate.second->accept(this), blocks.at(candidate.first));
        }
    }
}
