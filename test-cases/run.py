import os
import sys
from shulang import *

def print_indentation(indentation):
    if indentation > 0:
        print("\t" * indentation, end='')

def print_ast(node : ASTNode, indentation = 0):
    if indentation > 0:
        print("  " * indentation, end='')
    match node:
        case ProgramNode():
            indentation = 0
            print("PROGRAM:")
            for node in node.children():
                print_ast(node, indentation + 1)
        case OperatorApplicationNode():
            print("OPERATOR(" + node.op + ")")
            print_ast(node.rhs, indentation + 1)
            print_ast(node.lhs, indentation + 1)
        case BindingNode():
            print("BIND(" + node.name + ") to")
            print_ast(node.value, indentation + 1)
        case VariableReferenceNode():
            print("REFERENCE(" + node.identifier + ")")
        case IntegerNode():
            print("INTEGER(" + str(node.value) + ")")
        case PrintNode():
            print("PRINT")
            print_ast(node.to_print, indentation + 1)

node_counter = 0
def get_unique_node_name():
    global node_counter
    node_counter += 1
    return "node" + str(node_counter)

def graph_ast(node, indentation = 0, parent=''):
    print_indentation(indentation)
    match node:
        case ProgramNode():
            print("digraph ShuLangProgram {")
            for node in node.children():
                graph_ast(node, indentation + 1, "program")
            print("}")
        case OperatorApplicationNode():
            my_node = get_unique_node_name()
            print(my_node + '[label="' + node.op + '"]')
            print_indentation(indentation)
            print(parent, "->", my_node)
            graph_ast(node.lhs, indentation, my_node)
            graph_ast(node.rhs, indentation, my_node)
        case BindingNode():
            my_node = get_unique_node_name()
            print(my_node + '[label="bind ' + node.name + '"]')
            graph_ast(node.value, indentation, my_node)
        case PrintNode():
            my_node = get_unique_node_name()
            print(my_node + '[label="print"]')
            graph_ast(node.to_print, indentation, my_node)
        case IntegerNode():
            my_node = get_unique_node_name()
            print(my_node + '[label="', str(node.value), '"]')
            print_indentation(indentation)
            print(parent, "->", my_node)
        case VariableReferenceNode():
            my_node = get_unique_node_name()
            print(my_node + '[label="', node.identifier, '"]')
            print_indentation(indentation)
            print(parent, "->", my_node)

def get_value(node, env):
    match node:
        case IntegerNode():
            return node.value
        case VariableReferenceNode():
            return env[node.identifier]
        case OperatorApplicationNode():
            lhs = get_value(node.lhs, env)
            rhs = get_value(node.rhs, env)
            match node.op:
                case '+':
                    return lhs + rhs
                case '-':
                    return lhs - rhs
                case '*':
                    return lhs * rhs
                case _:
                    print("Unrecognized operator", node.op)
                    exit(1)

def run_ast(node, env = {}, stdout = []):
    match node:
        case ProgramNode():
            for node in node.children():
                run_ast(node, env, stdout)
            return stdout
        case BindingNode():
            env[node.name] = get_value(node.value, env)
        case PrintNode():
            printable = get_value(node.to_print, env)
            print(printable)
            stdout.append(printable)

def stringify_value(node):
    match node:
        case ImmediateNode():
            return "$" + str(node.number)
        case ReferenceNode():
            return "%" + node.identifier
        case AddNode():
            return stringify_value(node.lhs) + " + " + stringify_value(node.rhs)
        case SubNode():
            return stringify_value(node.lhs) + " - " + stringify_value(node.rhs)
        case MultNode():
            return stringify_value(node.lhs) + " * " + stringify_value(node.rhs)
        case _:
            print("Unknown value", node)
            exit(1)

def print_sir_ast(node, indentation = 0):
    if indentation > 0:
        print("  " * indentation, end='')
    match node:
        case SIRProgramNode():
            print("SIRProgram")
            indentation += 1
            for block in node.blocks:
                print("  " * indentation, block.name + ":")
                for node in block.instructions:
                    print_sir_ast(node, indentation + 1)
        case SIRPrintNode():
            print("PRINT", stringify_value(node.to_print))
        case DefinitionNode():
            print(node.identifier, "<-", stringify_value(node.binding))
        case _:
            print("Unknown definition", node)
            exit(1)

def get_sir_value(node, env):
    match node:
        case ImmediateNode():
            return node.number
        case ReferenceNode():
            return env[node.identifier]
        case AddNode():
            return get_sir_value(node.lhs, env) + get_sir_value(node.rhs, env)
        case SubNode():
            return get_sir_value(node.lhs, env) - get_sir_value(node.rhs, env)
        case MultNode():
            return get_sir_value(node.lhs, env) * get_sir_value(node.rhs, env)

def run_sir_ast(node, env, stdout):
    match node:
        case SIRProgramNode():
            for block in node.blocks:
                for node in block.instructions:
                    run_sir_ast(node, env, stdout)
        case SIRPrintNode():
            val = get_sir_value(node.to_print, env)
            print(val)
            stdout.append(val)
        case DefinitionNode():
            val = get_sir_value(node.binding, env)
            env[node.identifier] = val
    return stdout
            
def compare_stdout(out1, out2, filename, pass_name):
    if len(out1) != len(out2):
        print("Hmm, these standard outs look different")
        print("Did you insert or remove a print node somewhere?")
        print("Error during compilation of", filename, "during pass", pass_name)
        exit(-1)
    
    for (f, s) in zip(out1, out2):
        if str(f) != str(s):
            print(f, "was expected but instead got", s)
            print("Error during compilation of", filename)
            exit(1)

def run_case(file_name):
    print("Compiling", file_name)
    ast = parse_file(file_name)
    print("---INITIAL AST---")
    print_ast(ast)
    graph_ast(ast)
    print("Running")
    first_stdout = run_ast(ast, {}, [])

    print("---UNIQUIFICATION---")
    uniquify(ast)
    print_ast(ast)
    graph_ast(ast)
    print("Running")
    uniquify_stdout = run_ast(ast, {}, [])
    compare_stdout(first_stdout, uniquify_stdout, file_name, "uniquify")

    print("---REMOVE COMPLEX OPERANDS---")
    remove_complex_operands(ast)
    print_ast(ast)
    graph_ast(ast)
    print("Running")
    rco_stdout = run_ast(ast, {}, [])
    compare_stdout(first_stdout, rco_stdout, file_name, "remove complex opereands")

    print("---SELECT SIR INSTRUCTIONS---")
    sir_program = select_instructions(ast)
    print_sir_ast(sir_program)
    select_stdout = run_sir_ast(sir_program, {}, [])
    compare_stdout(first_stdout, select_stdout, file_name, "select SIR instructions")

    print("---SELECT LLVM INSTRUCTIONS---")
    select_llvm(sir_program, file_name, 'a.ll')
    os.system("clang a.ll -o a.out && ./a.out > output.log")
    with open("a.ll", "r") as fd:
        for x in fd.readlines():
            print(x)    

    with open("output.log", "r") as fd:
        output = [x.strip() for x in fd.readlines()]
    os.system("rm -f a.ll a.out output.log")
    compare_stdout(first_stdout, output, file_name, "select LLVM instructions")

    print("Test", file_name, "passed")

if __name__ == '__main__':
    tests_ran = 0
    if len(sys.argv) == 0:
        # Halo
        print("I need a test case")
    
    for x in range(1, len(sys.argv)):
        shulangable = sys.argv[x]
        if os.path.isfile(shulangable):
            run_case(shulangable)
        elif os.path.isdir(shulangable):
            files = sorted(os.listdir(shulangable))
            for file in files:      
                fp = os.path.join(shulangable, file)
                run_case(fp)
                print()
                tests_ran += 1
        else:
            print("I don't know what", shulangable, "is")

    if tests_ran > 0:
        print(tests_ran, "tests passed. Good job!")
