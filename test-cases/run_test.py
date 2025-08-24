import os
import sys
import subprocess
from shulang import *
from shulang_utils import *
from sir_utils import *

def compare_stdout(out1, out2, filename, pass_name):
    if len(out1) != len(out2):
        print("Hmm, the lengths of these standard outs look different")
        print("Did you insert or remove a print node somewhere?")
        print("Error during compilation of", filename, "during pass", pass_name)
        exit(-1)
    
    for (f, s) in zip(out1, out2):
        # TODO: When strings are added something not this dumb
        if str(f) != str(s):
            print(f, "was expected but instead got", s)
            print("Error during compilation of", filename, "during pass", pass_name)
            exit(1)

def run_case(file_name):
    if not os.path.exists(file_name + ".exp"):
        print("Could not find", file_name + '.exp', "Please add it")
        return 
    
    with open(file_name + ".exp", "r") as f:
        expected_stdout = [str(x).strip() for x in f.readlines()]
            
    print("Compiling", file_name)
    ast = parse_file(file_name)
    print("---INITIAL AST---")
    # print_ast(ast)
    graph_ast(ast)
    print("Type checking...")
    type_check(ast)
    print("Running...")
    parse_stdout = run_ast(ast, {}, [])
    compare_stdout(expected_stdout, parse_stdout, file_name, "parsing")

    # print("---UNIQUIFICATION---")
    # uniquify(ast)
    # print_ast(ast)
    # graph_ast(ast)
    # print("Running...")
    # uniquify_stdout = run_ast(ast, {}, [])
    # compare_stdout(expected_stdout, uniquify_stdout, file_name, "uniquify")

    print("---SHORT CIRCUIT-IFICATION")
    short_circuitify(ast)
    # print_ast(ast)
    # graph_ast(ast)
    print("Type checking...")
    type_check(ast)
    print("Running...")
    short_stdout = run_ast(ast, {}, [])
    compare_stdout(expected_stdout, short_stdout, file_name, "short circuitification")

    print("---REMOVE COMPLEX OPERANDS---")
    remove_complex_operands(ast)
    # print_ast(ast)
    # graph_ast(ast)
    print("Type checking...")
    type_check(ast)
    print("Running")
    rco_stdout = run_ast(ast, {}, [])
    compare_stdout(expected_stdout, rco_stdout, file_name, "remove complex opereands")

    print("---SELECT SIR INSTRUCTIONS---")
    sir_program = select_instructions(ast)
    # print_sir_ast(sir_program)
    # graph_sir_program(sir_program)

    # TODO: Pseudophi still not working
    # print("Running")
    # select_stdout = run_sir_program(sir_program)
    # compare_stdout(expected_stdout, select_stdout, file_name, "select SIR instructions")


    print("---PROMOTE PSEUDO PHI---")
    promote_pseudo_phi(sir_program)
    # print_sir_ast(sir_program)
    graph_sir_program(sir_program)
    print("Running")

    promote_pseudo_phi_stdout = run_sir_program(sir_program)
    compare_stdout(expected_stdout, promote_pseudo_phi_stdout, file_name, "promote pseudo phi")
    print("---SELECT LLVM INSTRUCTIONS---")
    select_llvm(sir_program, file_name, 'a.ll')
    subprocess.run("clang a.ll -O0 -g -o a.out", shell=True)
    output = subprocess.run("./a.out", shell=True, capture_output=True)
    if output.returncode == -11:
        print("SIGSEGV\n\tAt ", file_name, "\nSpecifically error code 139 (-11 in Python)")
        exit(1)
    output_stdout = output.stdout.decode("utf-8")[0:-1].split("\n")
    os.system("rm -f a.ll a.out")
    compare_stdout(expected_stdout, output_stdout, file_name, "select LLVM instructions")

    print("Test", file_name, "passed")


def run_regression_tests(dir):
    # This next line is a crime...
    ShuC_file_dir = '../src/output/ShuC.out'
    for file in sorted(os.listdir(dir)):
        if file[-3:] != '.sl':
            continue

        compile_output = subprocess.run(ShuC_file_dir + ' ' + os.path.join(dir, file) + ' -o a.ll', shell=True)
        if compile_output.returncode != 0:
            print("Failed to compile regression test", file)
            print(compile_output.stdout)
            exit(1)

        diff_output = subprocess.run('diff ' + os.path.join(dir, file[0:-3] + '.ll') + ' a.ll', shell=True, capture_output=True)
        if diff_output.returncode != 0:
            print(diff_output.stdout.decode("utf-8"))
            print(file + ' has changed! See a.ll...')
            exit(1)

    print('Regression test', dir, 'passed!')

if __name__ == '__main__':
    tests_ran = 0
    if len(sys.argv) == 1:
        # Halo
        print("I need a test case")

    for x in range(1, len(sys.argv)):
        shulangable = sys.argv[x]

        if shulangable == '--regression':
            run_regression_tests('phase_1_programs')
            run_regression_tests('phase_2_programs')
            run_regression_tests('phase_3_programs')
            os.system("rm -f a.out")
        elif os.path.isfile(shulangable):
            run_case(shulangable)
        elif os.path.isdir(shulangable):
            files = sorted(os.listdir(shulangable))
            for file in files:      
                fp = os.path.join(shulangable, file)
                if fp[-3:] != '.sl':
                    continue

                run_case(fp)
                print()
                tests_ran += 1
        else:
            print("I don't know what", shulangable, "is")

    if tests_ran > 0:
        print(tests_ran, "tests passed. Good job!")
