#include <ShuIRAST.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangPrinter.hpp>
#include <fstream>
#include <LLVMCodegenVisitor.hpp>
#include <LLVMSelection.hpp>
#include <iostream>
#include <ostream>
#include <parser.hpp>
#include <vector>
#include <RemoveComplexOperands.hpp>
#include <SelectInstructions.hpp>
#include <tokenizer.hpp>
#include <Uniquification.hpp>

static std::string output_file = "a.ll";

std::string process_arguments(int argc, char** argv) {
    int to_compile_idx = -1;
    for (int i = 1; i < argc; i++) {
        std::string arg = argv[i];
        if (arg == "-o") {
            i += 1;
            output_file = std::string(argv[i]);
        }
        else {
            if (to_compile_idx == -1){
                to_compile_idx = i;
            }
            else {
                std::cout << "ShuC: warning: it seems like multiple files have been passed in for compilation. ShuC doesn't support this right now, so only the first file:" << 
                std::endl << "\t" << argv[i] << std::endl << "Will be compiled." << std::endl;
            }
        }
    }

    if (to_compile_idx == -1) {
        std::cout << "ShuC: fatal error: no input files" << std::endl;
        exit(1);
    }
    return std::string(argv[to_compile_idx]);
}

int main(int argc, char** argv) {
    std::string filename = process_arguments(argc, argv);
    
    std::ifstream myfile;
    myfile.open(filename);
    if (!myfile.is_open()) {
        std::cout << "ShuC: Error opening file " << argv[1] << std::endl;
        return -1;
    }

    // std::cout << "-----TOKENIZATION-----" << std::endl;
    std::vector<token> token_list;
    tokenize(myfile, token_list);
    myfile.close();


    // for (int i = 0; i < tokens; i++) {  
    //     token t = token_list.at(i);
    //     std::string ty;
    //     token_type_to_string(ty, t.type);
    //     std::cout << "(" << t.value << ", " << ty << ")" << std::endl;
    // }


    // std::cout << "-----PARSING-----" << std::endl;
    // Recursive descent parsing
    std::unique_ptr<shulang::ProgramNode> program = begin_parse(token_list, argv[1]);
    // ShuLangPrinter().walk(program.get());

    // std::cout << "-----UNIQUIFICATION-----" << std::endl;
    // If I do somethingl ike
    // bind x to 5 bind x to 6
    // that becomes bind x.0 to 5 bind x.1 to 6
    // every variable gets a unique name
    Uniquification().walk(program.get());
    // ShuLangPrinter().walk(program.get());


    // std::cout << "-----REMOVE COMPLEX OPERANDS-----" << std::endl;
    // Say I do bind x to (1 + 2) + (3 + 4)
    // that gets changed to bind tmp0 to 1 + 2 bind tmp1 to 3 + 4 bind x to tmp0 + tmp1
    // this makes going into ShuIR easier
    remove_complex_operands(program.get());
    // ShuLangPrinter().walk(program.get());

    // std::cout << "-----SELECT SIR INSTRUCTIONS-----" << std::endl;
    // Lowering to SSA
    shuir::ProgramNode sir_program = select_SIR_instructions(program.get());

    // std::cout << "-----SELECT LLVM INSUTRCTIONS-----" << std::endl;
    // Emitting LLVM
    // Later on we'll also tell LLVm to do some optimizations
    // e.g. alloca promotion
    select_llvm_instructions(&sir_program, std::string(argv[1]), output_file);
    return 0;
}
