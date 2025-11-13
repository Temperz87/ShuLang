import os
import sys
import subprocess
from shulang import *
from shulang_utils import *
from sir_utils import *

SHOULD_GRAPH_SHULANG = False
SHOULD_GRAPH_SIR = False

def update_progress_bar(percentage: float) -> None:
    # Neat little progress bar
    amt = int(percentage * 10) 
    progress = 'Progress: [' + ('#' * amt) + (' ' * (10 - amt)) + '] ' + str(int(percentage * 100)) + '%'
    print("\33[2K\r" + progress, end='')

def compare_stdout(out1, out2, filename, pass_name):
    if len(out1) != len(out2):
        print()
        print("Hmm, the lengths of these standard outs look different")
        print("Did you insert or remove a print node somewhere?")
        print(f'({len(out1)} vs {len(out2)})')
        print("Error during compilation of", filename, "during pass", pass_name)
        exit(-1)
    
    for (f, s) in zip(out1, out2):
        # TODO: When strings are added something not this dumb
        if str(f) != str(s):
            print()
            print(f, "was expected but instead got", s)
            print("Error during compilation of", filename, "during pass", pass_name)
            exit(1)

def run_case(file_name):
    if not os.path.exists(file_name + ".exp"):
        print("\nCould not find", file_name + '.exp', "Please add it")
        return 
    
    with open(file_name + ".exp", "r") as f:
        expected_stdout = [str(x).strip() for x in f.readlines()]
            
    verbose("Compiling", file_name)
    ast = parse_file(file_name)
    
    verbose("---INITIAL AST---")
    # print_ast(ast)
    if SHOULD_GRAPH_SHULANG:
        graph_ast(ast)
    verbose("Type checking...")
    type_check(ast)
    verbose("Running...")
    parse_stdout = run_ast(ast, {}, [])
    compare_stdout(expected_stdout, parse_stdout, file_name, "parsing")

    # print("---UNIQUIFICATION---")
    # uniquify(ast)
    # print_ast(ast)
    # graph_ast(ast)
    # print("Running...")
    # uniquify_stdout = run_ast(ast, {}, [])
    # compare_stdout(expected_stdout, uniquify_stdout, file_name, "uniquify")

    verbose("---SHORT CIRCUIT-IFICATION---")
    short_circuitify(ast)
    # print_ast(ast)
    if SHOULD_GRAPH_SHULANG:
        graph_ast(ast)
    verbose("Type checking...")
    type_check(ast)
    verbose("Running...")
    short_stdout = run_ast(ast, {}, [])
    compare_stdout(expected_stdout, short_stdout, file_name, "short circuitification")

    verbose("---REMOVE COMPLEX OPERANDS---")
    remove_complex_operands(ast)
    # print_ast(ast)
    if SHOULD_GRAPH_SHULANG:
        graph_ast(ast)
    verbose("Type checking...")
    type_check(ast)
    verbose("Running")
    rco_stdout = run_ast(ast, {}, [])
    compare_stdout(expected_stdout, rco_stdout, file_name, "remove complex opereands")

    verbose("---SELECT SIR INSTRUCTIONS---")
    sir_program = select_instructions(ast)
    # print_sir_ast(sir_program)
    if SHOULD_GRAPH_SIR:
        graph_sir_program(sir_program)
    verbose("Running")
    # TODO: Pseudo phi nodes aren't handled so we can't run this
    #       Maybe they just can't be handled?
    # select_stdout = run_sir_program(sir_program)
    # compare_stdout(expected_stdout, select_stdout, file_name, "select SIR instructions")

    verbose("---PROMOTE PSEUDO PHI---")
    promote_pseudo_phi(sir_program)
    # print_sir_ast(sir_program)
    if SHOULD_GRAPH_SIR:
        graph_sir_program(sir_program)
    verbose("Running")
    promote_pseudo_phi_stdout = run_sir_program(sir_program)
    compare_stdout(expected_stdout, promote_pseudo_phi_stdout, file_name, "promote pseudo phi")
    verbose("---SELECT LLVM INSTRUCTIONS---")
    select_llvm(sir_program, file_name, 'a.ll')
    subprocess.run("clang a.ll -O0 -g -o a.out", shell=True)
    output = subprocess.run("./a.out", shell=True, capture_output=True)
    if output.returncode == -11:
        print("SIGSEGV\n\tAt ", file_name, "\nSpecifically error code 139 (-11 in Python)")
        exit(1)
    output_stdout = output.stdout.decode("utf-8")[0:-1].split("\n")
    os.system("rm -f a.ll a.out")

    # WHY DO I NEED THIS SUBPROCESS???
    if output_stdout == ['']:
        output_stdout = ''
    compare_stdout(expected_stdout, output_stdout, file_name, "select LLVM instructions")

    verbose("Test", file_name, "passed")


def run_regression_tests(dir):
    print('Running regression tests for dir:', dir)
    # This next line is a crime...
    shuc_file_dir = '../src/output/shuc'
    files = sorted([file for file in os.listdir(dir) if file.endswith('.sl')])
    total_files = len(files)
    ran_files = 0
    for file in files:
        if not file.endswith('.sl'):
            continue

        compile_output = subprocess.run(shuc_file_dir + ' ' + os.path.join(dir, file) + ' -o a.ll', shell=True)
        if compile_output.returncode != 0:
            print("Failed to compile regression test", file)
            print(compile_output.stdout)
            exit(1)

        expected_file = os.path.join(dir, file[0:-3] + '.ll')
        diff_output = subprocess.run('diff ' + expected_file + ' a.ll', shell=True, capture_output=True)
        if diff_output.returncode != 0:

            output = subprocess.run('clang a.ll -O0 -g -o a.out', shell=True)
            if output.returncode != 0:
                print('\nError: shuc generated file uncompilable by clang for:', file)
                print('\tSee a.out')
                exit(1)
            subprocess.run(f'clang {expected_file} -O0 -g -o b.out', shell=True)


            output_actual = subprocess.run('./a.out', shell=True, capture_output=True)
            output_expected = subprocess.run('./b.out', shell=True, capture_output=True)
            subprocess.run('rm -f a.out b.out', shell=True)
            
            expected = output_expected.stdout.decode("utf-8")[0:-1].split("\n")
            actual = output_actual.stdout.decode("utf-8")[0:-1].split("\n")
            compare_stdout(actual, expected, file, 'regression')

            # We could print this information, but if the output is the same
            # Then everything should be fine 
            #   Assuming test coverage is good of course
            # print('Warning:', file[0:-2] + 'll', 'has changed!')
            # print(diff_output.stdout.decode("utf-8"))
            # print('But the output is the same')
        
        ran_files += 1
        update_progress_bar(ran_files / total_files)

    print('Regression test', dir, 'passed!')

if __name__ == '__main__':
    tests_ran = 0
    if len(sys.argv) == 1:
        # Halo
        print("I need a test case")

    shulangables = []
    for x in range(1, len(sys.argv)):
        arg = sys.argv[x]
        if arg == '--regression':
            run_regression_tests('phase_1_programs')
            run_regression_tests('phase_2_programs')
            run_regression_tests('phase_3_programs')
            os.system("rm -f a.ll")
        elif arg == '--graph-sir':
            SHOULD_GRAPH_SIR = True
        elif arg == '--graph-shulang':
            SHOULD_GRAPH_SHULANG = True
        elif arg == '--verbose':
            set_verbose(True)
        elif os.path.isfile(arg):
            shulangables.append(arg)
        elif os.path.isdir(arg):
            files = sorted(os.listdir(arg))
            for file in files:      
                fp = os.path.join(arg, file)
                if fp[-3:] != '.sl':
                    continue
                shulangables.append(fp)
        else:
            print("I don't know what", arg, "is")

    tests_ran = 0
    tests_to_run = len(shulangables)
    for file in shulangables:
        run_case(file)
        verbose()
        tests_ran += 1
        if not VERBOSE:
            update_progress_bar(tests_ran / tests_to_run)

    if tests_ran > 0:
        if not VERBOSE:
            print()
        print(tests_ran, "tests passed. Good job!")
