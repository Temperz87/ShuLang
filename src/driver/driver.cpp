#include <Analysis.hpp>
#include <chrono>
#include <deque>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <LLVMCodegenVisitor.hpp>
#include <LLVMSelection.hpp>
#include <llvm/IR/Verifier.h>
#include <memory>
#include <ostream>
#include <parser.hpp>
#include <PromotePseudoPhi.hpp>
#include <SelectInstructions.hpp>
#include <SIRAST.hpp>
#include <SIRCallGraph.hpp>
#include <SIRCFG.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangPasses.hpp>
#include <SIROptimizations.hpp>
#include <tokenizer.hpp>
#include <TypeChecker.hpp>
#include <unordered_set>
#include <vector>

static std::string output_file = "a.out";
static int optimization_level = 1;
static bool print_timings = false;
static bool emit_llvmir = false;

void emit_help() {
    std::cout << "ShuC: Usage: shuc <filename>" << std::endl;
    std::cout << "NOTE: Only one file can be compiled per instance of ShuC" << std::endl;
    std::cout << "CLI arguments:" << std::endl;
    std::cout << "--help:\n\tDisplays this message" << std::endl;
    std::cout << "-l\n\tOutputs LLVM IR instead of an executable" << std::endl;
    std::cout << "-o <path>\n\tOutputs the compiled file the provided path" << std::endl;
    std::cout << "-O<n>\n\tEnables optimizations up to level `n`. Currently, the maximum optimization level is `1`" << std::endl;
    std::cout << "--timings\n\tDisplays how long each pass took to finish" << std::endl;
}

std::string process_arguments(int argc, char** argv) {
    bool warned_multiple_files = false;
    int to_compile_idx = -1;
    for (int i = 1; i < argc; i++) {
        std::string arg = argv[i];
        if (arg == "-o") {
            i += 1;
            output_file = std::string(argv[i]);
        }
        else if (arg == "-l") {
            emit_llvmir = true;
        }
        else if (arg == "--timings") {
            print_timings = true;
        }
        else if (arg == "--help") {
            emit_help();
            if (to_compile_idx == -1) {
                to_compile_idx = -2;
            }
        }
        else {
            if (arg[0] == '-' && arg[1] == 'O') {
                optimization_level = arg[2] - '0';
                continue;
            }

            if (to_compile_idx == -1){
                to_compile_idx = i;
            }
            else {
                if (!warned_multiple_files) {
                    std::cout << "ShuC: warning: it seems like multiple files have been passed in for compilation. ShuC doesn't support this right now, so only the first file:" << 
                    std::endl << "\t" << argv[i] << std::endl << "Will be compiled." << std::endl;
                    warned_multiple_files = true;
                }
            }
        }
    }

    if (to_compile_idx == -1)
        std::cout << "ShuC: fatal error: no input files" << std::endl;

    if (to_compile_idx < 0)
        exit(1);

    return std::string(argv[to_compile_idx]);
}

void time_phase(const std::string& name, auto fn) {
    if (!print_timings) {
        fn();
        return;
    }

    std::chrono::time_point start = std::chrono::high_resolution_clock::now();
    fn();
    std::chrono::time_point end = std::chrono::high_resolution_clock::now();
    long time = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();
    std::cout << name << ": " << time << " micro seconds\n";
};

int main(int argc, char** argv) {
    std::string filename = process_arguments(argc, argv);
    std::ifstream myfile;
    myfile.open(filename);
    if (!myfile.is_open()) {
        std::cout << "ShuC: Error opening file " << argv[1] << std::endl;
        return -1;
    }

    std::chrono::time_point compile_start = std::chrono::high_resolution_clock::now();

    // std::cout << "-----TOKENIZATION-----" << std::endl;
    std::vector<token> token_list;
    time_phase("Tokenization", [&]() {
        tokenize(myfile, token_list);
    });    
    myfile.close();

    // std::cout << "-----PARSING-----" << std::endl;
    // Recursive descent parsing
    std::unique_ptr<shulang::ProgramNode> program;
    time_phase("Parsing", [&]() {
        program = begin_parse(token_list, argv[1]);
    });


    // std::cout << "-----TYPE CHECKING-----" << std::endl;
    // We only type check one time
    // Because if all the compiler tests pass
    // There won't be any type issues at runtime
    time_phase("Type Checking", [&]() {
        TypeChecker tyc;
        program->accept(&tyc);
    });

    // std::cout << "-----SHORT CIRCUIT-IFICATION-----" << std::endl;
    // And with a complex rhs become
    //  if (lhs) rhs else false
    // Or's similarly become
    //  if (lhs) true else rhs
    time_phase("Short Circuitify", [&]() { short_circuitify(program.get()); });
    
    // std::cout << "-----REMOVE COMPLEX OPERANDS-----" << std::endl;
    // Say I do bind x to (1 + 2) + (3 + 4)
    // that gets changed to bind tmp0 to 1 + 2 bind tmp1 to 3 + 4 bind x to tmp0 + tmp1
    // this makes going into SIR easier
    time_phase("Remove Complex Operands", [&]() { remove_complex_operands(program.get()); });    // ShuLangPrinter().walk(program.get());

    // std::cout << "-----SELECT SIR INSTRUCTIONS-----" << std::endl;
    // Lowering to SSA and creating pseudo phi nodes
    sir::ProgramNode sir_program; 
    time_phase("SIR Instruction Selection", [&]() {
        sir_program = select_SIR_instructions(program.get());
    });

    // std::cout << "-----PROMOTE PHI-----" << std::endl;
    // Making the pseudo phi nodes PhiNodes
    time_phase("Promote Phi", [&]() { promote_pseudo_phi(&sir_program); });
    // Optimizations
    
    if (optimization_level) {
        std::vector<sir::FunctionDefinitionNode*> functions;
        for (std::shared_ptr<sir::FunctionDefinitionNode> function : sir_program.functions) {
            functions.push_back(function.get());
        } 

        time_phase("Optimizations", [&]() {
            // TODO: some better form of queueing optimizations
            std::vector<sir::FunctionDefinitionNode*> defs;
            for (const auto& def : sir_program.functions) {
                defs.push_back(def.get());
            }

            sir::AnalysisManager am(defs);

            std::unordered_set<sir::FunctionDefinitionNode*> seen({am.getCallGraph()->get_main()});
            std::deque<sir::FunctionDefinitionNode*> order({am.getCallGraph()->get_main()});
            while (!order.empty()) {
                sir::FunctionDefinitionNode* function = order.front();
                order.pop_front();
                for (const auto& incoming : am.getCallGraph()->get_outgoing(function)) {
                    if (seen.contains(incoming))
                        continue;
                    seen.insert(incoming);
                    order.push_back(incoming);
                }

                // Optimize the function!
                int optimization_iterations = 0;
                bool did_work;
                do {
                    optimization_iterations += 1;
                    did_work = false;

                    // This pass is just propagating IPSCCP results
                    // which already will evaluate to a fixpoint
                    // hence we don't track if it does work or not
                    SIRPropagate(function, am);
                    did_work |= SIRFold(function, am);
                    did_work |= CFGSimplify(function, am);
                    did_work |= CFGMerge(function, am);
                    did_work |= SIRDSE(function, am);
                } while (did_work);

                if (print_timings) {
                    std::cout << "Optimization iterations for " << function->name << ": " << optimization_iterations << "\n";
                }
            }
        });
    }

    // std::cout << "-----LLVM CODE GENERATION-----" << std::endl;
    // Emitting LLVM

    // Context has to made before module
    // as module depends on the context
    llvm::LLVMContext context;
    std::unique_ptr<llvm::Module> module;
    time_phase("LLVM Codegen", [&]() {
        module = select_llvm_instructions(&sir_program, std::string(filename), context);
    });    

    // Emit object file
    std::string obj;
    if (emit_llvmir) {
        if (output_file == "a.out") {
            obj = "a.ll";
        }
        else  {
            obj = output_file;
        }
    } 
    else {
        obj = 
            std::filesystem::temp_directory_path().string() + "/shuc-" + std::to_string(std::rand()) + ".ll";
    }

    std::error_code code;
    llvm::raw_fd_ostream fd(obj, code);
    if (code) {
        std::cout << "ShuC: Error when writing to file " << obj;
        std::cout << "\n\tIs it open in another program?";
        std::cout << "\n\tDo I have permission to open and write to it?" << std::endl;
        exit(1);
    }
    
    module->print(fd, nullptr);
    fd.close();
    if (print_timings) {
        std::chrono::time_point compile_end = std::chrono::high_resolution_clock::now();
        long total = std::chrono::duration_cast<std::chrono::microseconds>(
            compile_end - compile_start).count();
        std::cout << "Total compilation time: " << total << " micro seconds\n";
    }

    if (emit_llvmir) { 
        return 0;
    }

    std::string command = "clang " + obj + " -o " + output_file;
    return std::system(command.c_str());
}
