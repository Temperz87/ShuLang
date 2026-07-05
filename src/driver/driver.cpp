#include <Analysis.hpp>
#include <chrono>
#include <fstream>
#include <iostream>
#include <LLVMCodegenVisitor.hpp>
#include <LLVMSelection.hpp>
#include <memory>
#include <ostream>
#include <parser.hpp>
#include <PromotePseudoPhi.hpp>
#include <SelectInstructions.hpp>
#include <SIRAST.hpp>
#include <SIRCFG.hpp>
#include <ShuLangAST.hpp>
#include <ShuLangPasses.hpp>
#include <SIROptimizations.hpp>
#include <tokenizer.hpp>
#include <TypeChecker.hpp>
#include <vector>

static std::string output_file = "a.ll";
static int optimization_level = 1;
static bool print_timings = false;

std::string process_arguments(int argc, char** argv) {
    bool warned_multiple_files = false;
    int to_compile_idx = -1;
    for (int i = 1; i < argc; i++) {
        std::string arg = argv[i];
        if (arg == "-o") {
            i += 1;
            output_file = std::string(argv[i]);
        }
        else if (arg == "--timings") {
            print_timings = true;
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

    if (to_compile_idx == -1) {
        std::cout << "ShuC: fatal error: no input files" << std::endl;
        exit(1);
    }

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
        for (auto function : sir_program.functions) {
        int optimazation_iterations = 0;
        time_phase("Optimizations", [&]() {
            // TODO: some better form of queueing optimizations
            bool did_work;
            do {
                optimazation_iterations +=  1;
                did_work = false;

                // Rebuild analysis
                std::vector<sir::SIRBlock*> blocks;
                for (std::shared_ptr<sir::SIRBlock> b : function->blocks) {
                    blocks.push_back(b.get());
                } 

                sir::SIRControlFlowGraph cfg(blocks);
                UseDefInfo info = UseDefAnalysis::get_use_def_chains(cfg);
                SCCPResults sccp = SIRSCCP(cfg, function.get(), info);

                // Run optimizations
                SIRPropagate(function.get(), sccp.constants);
                SIRFold(function.get(), sccp.constants);
                did_work |= CFGSimplify(function.get(), cfg, sccp);

                // CFGSimplify invalidates the CFG and usedef analysis
                // hence we rebuild them here!
                if (did_work) {
                    blocks.clear();
                    for (std::shared_ptr<sir::SIRBlock> b : function->blocks) {
                        blocks.push_back(b.get());
                    } 

                    cfg = sir::SIRControlFlowGraph(blocks);
                    info = UseDefAnalysis::get_use_def_chains(cfg);
                }

                bool cfg_merged = CFGMerge(function.get(), cfg);
                did_work |= cfg_merged;
                if (cfg_merged) {
                    blocks.clear();
                    for (std::shared_ptr<sir::SIRBlock> b : function->blocks) {
                        blocks.push_back(b.get());
                    } 

                    cfg = sir::SIRControlFlowGraph(blocks);
                }

                info = UseDefAnalysis::get_use_def_chains(cfg);
                bool dse = SIRDSE(info, cfg);
                did_work |= dse;
            } while (did_work);
        });

        if (print_timings) {
            std::cout << "Optimization iterations for " << function->name << ": " << optimazation_iterations << "\n";
        }
        }
    }

    // std::cout << "-----LLVM CODE GENERATION-----" << std::endl;
    // Emitting LLVM
    time_phase("LLVM Codegen", [&]() {
        select_llvm_instructions(&sir_program, std::string(argv[1]), output_file);
    });    

    if (print_timings) {
        std::chrono::time_point compile_end = std::chrono::high_resolution_clock::now();
        long total = std::chrono::duration_cast<std::chrono::microseconds>(
            compile_end - compile_start).count();
        std::cout << "Total compilation time: " << total << " micro seconds\n";
}

    return 0;
}
