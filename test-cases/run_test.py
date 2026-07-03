import os
import sys
import subprocess
from shulang import *
from shulang_utils import *
from sir_utils import *

SHOULD_GRAPH_SHULANG = False
SHOULD_GRAPH_SIR = False

dontdelete = []
def update_progress_bar(percentage: float) -> None:
    # Neat little progress bar
    amt = int(percentage * 10) 
    progress = 'Progress: [' + ('#' * amt) + (' ' * (10 - amt)) + '] ' + str(int(percentage * 100)) + '%'
    print("\33[2K\r" + progress, end='')

def compare_stdout(expected_out, actual_out, filename, pass_name):
    if len(expected_out) != len(actual_out):
        print("Hmm, the lengths of these standard outs look different")
        print("Did you insert or remove a print node somewhere?")
        print(f'(Expected: {len(expected_out)} but got: {len(actual_out)})')
        return False
    
    for (f, s) in zip(expected_out, actual_out):
        # TODO: When strings are added something not this dumb
        if str(f) != str(s):
            print()
            print(f, "was expected but instead got", s)
            return False
        
    return True

def check_expect_output(expected_out, actual_out, filename, pass_name, ast, is_shulang):
    if not compare_stdout(expected_out, actual_out, filename, pass_name):
        print("Error during compilation of", filename, "during pass", pass_name)
        with open(f'./failure {pass_name}.dot', 'w') as fd:
            if is_shulang:
                graph_ast(ast, file=fd)
            else:
                graph_sir_program(ast, file=fd)

        exit(1)


def run_program_with_input(filename: str, stdin: list[str]) -> list[str]:   
    proc = subprocess.Popen([filename], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True)
    for thing in stdin:
        if proc.returncode != None:
            break
        proc.stdin.write(thing + '\n')
    proc.stdin.close()

    if proc.returncode == -11:
        print("SIGSEGV\n\tAt ", filename, "\nSpecifically error code 139 (-11 in Python)")
        exit(1)
    return [x.removesuffix('\n') for x in proc.stdout.readlines()]

def try_type_check(ast, file_name, pass_name):
    try:
        type_check(ast)
    except:
        print('Error while type checking', file_name, 'during pass', pass_name)
        with open(f'./failure {pass_name}.dot', 'w') as fd:
            graph_ast(ast, file=fd)


def run_sir_pass(sir_program, pass_name: str, pass_func, expected_stdout, stdin, file_name):
    verbose(f"---{pass_name}---")
    ret = pass_func(sir_program)
    if SHOULD_GRAPH_SIR:
        graph_sir_program(sir_program)

    verbose('Running')
    output = run_sir_program(sir_program, iter(stdin), pass_name, file_name)
    check_expect_output(expected_stdout, output, file_name, pass_name, sir_program, False)
    return ret

def run_case(file_name):
    if not os.path.exists(file_name + ".exp"):
        print("\nCould not find", file_name + '.exp', "Please add it")
        return 
    
    with open(file_name + ".exp", "r") as f:
        expected_stdout = [str(x).strip() for x in f.readlines()]

    if os.path.exists(file_name + ".in"):
        with open(file_name + ".in", "r") as f:
            stdin = [str(x).strip() for x in f.readlines()]
    else:
        stdin = []

    verbose("Compiling", file_name)
    ast = parse_file(file_name)
    
    verbose("---INITIAL AST---")
    # print_ast(ast)
    if SHOULD_GRAPH_SHULANG:
        graph_ast(ast)

    verbose("Type checking...")
    try_type_check(ast, file_name, 'parsing')
    verbose("Running...")
    parse_stdout = run_ast(ast, iter(stdin), file_name, {}, [])
    check_expect_output(expected_stdout, parse_stdout, file_name, "parsing", ast, True)
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
    try_type_check(ast, file_name, 'short circuitification')
    verbose("Running...")
    short_stdout = run_ast(ast, iter(stdin), file_name, {}, [])
    check_expect_output(expected_stdout, short_stdout, file_name, "short circuitification", ast, True)

    verbose("---REMOVE COMPLEX OPERANDS---")
    remove_complex_operands(ast)
    # print_ast(ast)
    if SHOULD_GRAPH_SHULANG:
        graph_ast(ast)

    verbose("Type checking...")
    try_type_check(ast, file_name, 'remove complex operands')
    verbose("Running")
    rco_stdout = run_ast(ast, iter(stdin), file_name, {}, [])
    check_expect_output(expected_stdout, rco_stdout, file_name, "remove complex opereands", ast, True)

    verbose("---SELECT SIR INSTRUCTIONS---")
    sir_program = select_instructions(ast)
    # print_sir_ast(sir_program)
    if SHOULD_GRAPH_SIR:
        graph_sir_program(sir_program)


    # TODO: Pseudo phi nodes aren't handled so we can't run this
    #       Maybe they just can't be handled?
    # select_stdout = run_sir_program(sir_program)
    # compare_stdout(expected_stdout, select_stdout, file_name, "select SIR instructions")

    run_sir_pass(sir_program, 'PROMOTE PSEUDO PHI', promote_pseudo_phi, expected_stdout, stdin, file_name)

    verbose("---SELECT LLVM INSTRUCTIONS---")
    select_llvm(sir_program, file_name, 'a.ll')
    subprocess.run("clang a.ll -O0 -g -o a.out", shell=True)
    output_stdout = run_program_with_input('./a.out', stdin)
    os.system("rm -f a.ll a.out")
    compare_stdout(expected_stdout, output_stdout, file_name, "select LLVM instructions")
    verbose("Unoptimized compiled program passed")
    return

    verbose("---Optimization O1 pipeline---")
    did_work = True
    while did_work:
        did_work = False
        
        verbose("---Initial Analysis---")
        cfg = SIRControlFlowGraph(sir_program.blocks)
        usedef = UseDefAnalysis.get_use_def_chains(cfg)
        sccp = SIRSCCP(cfg, usedef)
    
        fold_pass = lambda x: SIRFold(x, sccp.constants)
        run_sir_pass(sir_program, 'SIRFold', fold_pass, expected_stdout, stdin, file_name)

        prop_pass = lambda x: SIRPropagate(x, sccp.constants)
        run_sir_pass(sir_program, 'SIRFold', prop_pass, expected_stdout, stdin, file_name)

        cfg = SIRControlFlowGraph(sir_program.blocks)
        cfg_simplify_pass = lambda x: CFGSimplify(x, cfg, sccp)
        did_work |= run_sir_pass(sir_program, 'CFGSimplify', cfg_simplify_pass, expected_stdout, stdin, file_name)

        cfg = SIRControlFlowGraph(sir_program.blocks)
        cfg_merge_pass = lambda x: CFGMerge(x, cfg)
        did_work |= run_sir_pass(sir_program, 'CFGMerge', cfg_merge_pass, expected_stdout, stdin, file_name)

        cfg = SIRControlFlowGraph(sir_program.blocks)
        usedef = UseDefAnalysis.get_use_def_chains(cfg)
        dse_pass = lambda x: SIRDSE(usedef, cfg)
        did_work |= run_sir_pass(sir_program, 'SIRDSE', dse_pass, expected_stdout, stdin, file_name)

    verbose("---SELECT LLVM INSTRUCTIONS---")
    select_llvm(sir_program, file_name, 'a.ll')
    subprocess.run("clang a.ll -O0 -g -o a.out", shell=True)
    output_stdout = run_program_with_input('./a.out', stdin)
    os.system("rm -f a.ll a.out")
    verbose("Compiled program passed")

def run_regression_tests(dir, optimization_level):
    print('Running regression tests for dir:', dir)
    # This next line is a crime...
    shuc_file_dir = '../src/output/shuc'
    files = sorted([file for file in os.listdir(dir) if file.endswith('.sl')])
    total_files = len(files)
    ran_files = 0
    files_changed = []
    for file in files:
        if not file.endswith('.sl'):
            continue
        fp = os.path.join(dir, file)

        compile_output = subprocess.run(shuc_file_dir + ' ' + os.path.join(dir, file) + f' -O{optimization_level} -o a.ll', shell=True)
        if compile_output.returncode != 0:
            print("Failed to compile regression test", file)
            print(compile_output.stdout)
            exit(1)

        expected_file = os.path.join(dir, file[0:-3] + '.ll')
        if optimization_level == 0:
            diff_output = subprocess.run('diff ' + expected_file + ' a.ll', shell=True, capture_output=True)

        if optimization_level > 0 or diff_output.returncode != 0:
            output = subprocess.run('clang a.ll -O0 -g -o a.out', shell=True)
            if output.returncode != 0:
                print('\nError: shuc generated file uncompilable by clang for:', file)
                print('\tSee a.ll')
                exit(1)

            with open(fp + '.exp', 'r') as f:
                expected = [str(x).strip() for x in f.readlines()]

            if os.path.exists(fp + ".in"):
                with open(fp + ".in", "r") as f:
                    stdin = [str(x).strip() for x in f.readlines()]
            else:
                stdin = []

            actual = run_program_with_input('./a.out', stdin)
            subprocess.run('rm -f a.out', shell=True)
            if not compare_stdout(expected, actual, fp, 'regression'):
                print("Failed to compile regression test", file)
                print('\n'.join(actual))
                exit(1)

            if optimization_level == 0:
                subprocess.run('mv a.ll ' + fp[0:-3] + '.ll', shell=True)
                files_changed.append(fp)

                # We could print this information, but if the output is the same
                # Then everything should be fine 
                #   Assuming test coverage is good of course
                print('Warning:', file[0:-2] + 'll', 'has changed!')
                print(diff_output.stdout.decode("utf-8"))
                print('But the output is the same')
        else:
            subprocess.run('rm -f a.ll', shell=True)

        ran_files += 1
        update_progress_bar(ran_files / total_files)
    
    print()
    if len(files_changed) > 0:
        print('Changed files:\n\t' + '\n\t'.join(files_changed))
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
            max_optimization = 1
            for i in range(0, max_optimization + 1):
                print('Testing optimization level:', i)
                run_regression_tests('binding-and-arithmatic-tests', i)
                run_regression_tests('if-tests', i)
                run_regression_tests('input-tests', i)
                run_regression_tests('select-tests', i)
                run_regression_tests('while-tests', i)
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
