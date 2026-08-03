#include <SIRAST.hpp>
#include <SIRCFG.hpp>
#include <LLVMCodegenVisitor.hpp>
#include <deque>
#include <llvm/IR/IRBuilder.h>
#include <iostream>
#include <llvm/IR/IRBuilder.h>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/Attributes.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalValue.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IR/NoFolder.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Alignment.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/TargetParser/Host.h>
#include <memory>
#include <unordered_set>

using namespace llvm;
using namespace sir;

void codegen_function(LLVMCodegenVisitor& visitor, std::shared_ptr<FunctionDefinitionNode> function, LLVMContext& context, IRBuilder<NoFolder>& builder, Module* module) {
    Function* llvm_function = module->getFunction(function->name);
    if (llvm_function == nullptr) {
        std::vector<Type*> paramTypes;
        for (auto param : function->parameters) {
            paramTypes.push_back(Type::getIntNTy(context, param->width));
        }

        Type* return_type;
        if (function->name == "main") {
            return_type = Type::getInt32Ty(context);
        }
        else {
            return_type = LLVMCodegenVisitor::SIR_to_llvm_type(context, function->return_width);
        }

        FunctionType* function_type
            = FunctionType::get(return_type, paramTypes, false);

        GlobalValue::LinkageTypes linkage = function->name == "main"? GlobalValue::ExternalLinkage : GlobalValue::InternalLinkage;
        llvm_function = Function::Create(function_type, linkage, function->name, module);
    }

    for (int i = 0; i < function->parameters.size(); i++) {
        auto param = function->parameters[i];
        visitor.bindings[param->identifier] = llvm_function->getArg(i);
    }

    std::vector<SIRBlock*> blocks;
    for (auto& block : function->blocks)
        blocks.push_back(block.get());
    SIRControlFlowGraph cfg(blocks);

    // First create the functions entry block
    // As LLVM recognizes the first block added as entry
    SIRBlock* entry = cfg.get_entry();
    BasicBlock* bb = BasicBlock::Create(context, entry->name, llvm_function);            
    visitor.blocks.insert({entry->name, bb});
    
    // Create the rest of the blocks
    for (auto& block : function->blocks) {
        if (block->name == "entry")
            continue;
        BasicBlock* bb = BasicBlock::Create(context, block->name, llvm_function);            
        visitor.blocks.insert({block->name, bb});
    }

    // Add exit block
    // needed for main and void functions
    if (function->name == "main" || function->return_width == 0) {
        BasicBlock* bb = BasicBlock::Create(context, "exit", llvm_function);
        visitor.blocks.insert({"exit", bb});
        builder.SetInsertPoint(bb);
        if (function->name == "main") {
            llvm_function->addFnAttr(Attribute::NoUnwind);
            builder.CreateRet(ConstantInt::getSigned(Type::getInt32Ty(context), 0));
        }
        else {
            builder.CreateRetVoid();
        }
    }

    // BFS graph to add blocks
    // So we don't reference bindings before they exist
    // Phi nodes get fixed later, we just declare them here
    std::deque<SIRBlock*> order({entry});
    std::unordered_set<SIRBlock*> seen({entry});
    while (!order.empty()) {
        SIRBlock* block = order.front();
        order.pop_front();
        for (SIRBlock* outgoing : cfg.get_outgoing(block)) {
            if (seen.contains(outgoing))
                continue;
            order.push_front(outgoing);
            seen.insert(outgoing);
        }

        builder.SetInsertPoint(visitor.blocks.at(block->name));
        visitor.walk(block);
    }

    visitor.fix_phi();
    if (verifyFunction(*llvm_function, &errs())) {
        std::cout << "ShuC: Error while compiling program during LLVM lowering\n\tPlease report the bug" << std::endl;
        // exit(1);
    }
}

std::unique_ptr<Module> select_llvm_instructions(ProgramNode* node, std::string source_filename, LLVMContext& context) {
    llvm::IRBuilder<llvm::NoFolder> builder(context);
    std::unique_ptr<Module> module = std::make_unique<Module>("Module", context);
    std::string tt = llvm::sys::getDefaultTargetTriple();
    module->setTargetTriple(Triple(tt));
    module->setSourceFileName(StringRef(source_filename));
    
    // Extern printf function
    FunctionType* printf_ty = FunctionType::get(Type::getInt32Ty(context), PointerType::get(Type::getInt8Ty(context), 0), true);
    Function::Create(printf_ty, Function::ExternalLinkage, "printf", *module);

    // Extern scanf function
    FunctionType* scanf_ty = FunctionType::get(Type::getInt32Ty(context), PointerType::get(Type::getInt8Ty(context), 0), true);
    Function::Create(scanf_ty, Function::ExternalLinkage, "scanf", *module);

    // Add %d format
    builder.CreateGlobalString(StringRef("%d\n"), "printf_integer_format", 0, module.get());
    // Add "true\n" format
    builder.CreateGlobalString(StringRef("true\n"), "printf_true_format", 0, module.get());
    // Add "false\n" format
    builder.CreateGlobalString(StringRef("false\n"), "printf_false_format", 0, module.get());
    
    // Add " %d" format
    builder.CreateGlobalString(StringRef(" %d"), "scanf_integer_format", 0, module.get());
    
    // Translate functions
    LLVMCodegenVisitor codegen(context, &builder, module.get());
    for (std::shared_ptr<FunctionDefinitionNode> function : node->functions) {
        codegen.reset();
        codegen_function(codegen, function, context, builder, module.get());
    }

    return module;
}
