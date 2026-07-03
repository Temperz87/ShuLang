#include <SIRAST.hpp>
#include <SIRCFG.hpp>
#include <LLVMCodegenVisitor.hpp>
#include "llvm/IR/IRBuilder.h"
#include <iostream>
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
#include <memory>
#include <system_error>

using namespace llvm;
using namespace sir;

void codegen_function(LLVMCodegenVisitor& visitor, std::shared_ptr<FunctionDefinitionNode> function, LLVMContext& context, IRBuilder<NoFolder>& builder, Module& module) {
    Function* llvm_function = module.getFunction(function->name);
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

    for (std::shared_ptr<SIRBlock> block : function->blocks) {
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

    for (std::shared_ptr<SIRBlock> block : function->blocks) {
        builder.SetInsertPoint(visitor.blocks.at(block->name));
        visitor.walk(block.get());
    }

    visitor.fix_phi();
    if (verifyFunction(*llvm_function, &errs())) {
        std::cout << "ShuC: Error while compiling program\n\tPlease report the bug" << std::endl;
        exit(1);
    }
}

void select_llvm_instructions(ProgramNode* node, std::string source_filename, std::string output) {
    LLVMContext context;
    IRBuilder<NoFolder> builder(context);
    Module module("Module", context);
    module.setTargetTriple(Triple("x86_64-pc-linux-gnu"));
    module.setSourceFileName(StringRef(source_filename));
    // Extern printf function
    FunctionType* printf_ty = FunctionType::get(Type::getInt32Ty(context), PointerType::get(Type::getInt8Ty(context), 0), true);
    Function::Create(printf_ty, Function::ExternalLinkage, "printf", module);

    // Extern scanf function
    FunctionType* scanf_ty = FunctionType::get(Type::getInt32Ty(context), PointerType::get(Type::getInt8Ty(context), 0), true);
    Function::Create(scanf_ty, Function::ExternalLinkage, "scanf", module);

    // Add %d format
    builder.CreateGlobalString(StringRef("%d\n"), "printf_integer_format", 0, &module);
    // Add "true\n" format
    builder.CreateGlobalString(StringRef("true\n"), "printf_true_format", 0, &module);
    // Add "false\n" format
    builder.CreateGlobalString(StringRef("false\n"), "printf_false_format", 0, &module);
    
    // Add " %d" format
    builder.CreateGlobalString(StringRef(" %d"), "scanf_integer_format", 0, &module);
    
    // Translate functions
    LLVMCodegenVisitor codegen(context, &builder, &module);
    for (std::shared_ptr<FunctionDefinitionNode> function : node->functions) {
        codegen.reset();
        codegen_function(codegen, function, context, builder, module);
    }

    std::error_code code;
    raw_fd_ostream fd(output, code);
    if (code) {
        std::cout << "ShuC: Error when writing to file " << output;
        std::cout << "\n\tIs it open in another program?";
        std::cout << "\n\tDo I have permission to open and write to it?" << std::endl;
        exit(1);
    }

    module.print(fd, nullptr);
    fd.close();
}
