import os
import sys
from shulang import ProgramNode, OperatorApplicationNode, BindingNode, \
    VariableReferenceNode, IntegerNode, PrintNode, ASTNode, parse_file, uniquify, remove_complex_operands

# TODO: Cleanup
# I kind of just through this file together

def print_ast(node : ASTNode, indentation=0):
    if indentation > 0:
        print("  " * indentation, end='')
    match node:
        case ProgramNode():
            indentation = 0
            print("PROGRAM:")
            for node in node.nodes:
                print_ast(node, indentation + 1)
        case OperatorApplicationNode():
            print("OPERATOR(" + node.op + ")")
            print_ast(node.lhs, indentation + 1)
            print_ast(node.rhs, indentation + 1)
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
                case _:
                    print("Unrecognized operator", node.op)
                    exit(1)

def run_ast(node, env = {}):
    match node:
        case ProgramNode():
            for node in node.nodes:
                run_ast(node)
        case BindingNode():
            env[node.name] = get_value(node.value, env)
        case PrintNode():
            printable = get_value(node.to_print, env)
            print(printable)
            
def run_case(file_name):
    print("Compiling", file_name)
    ast = parse_file(file_name)
    print("-----INITIAL AST-----")
    print_ast(ast)
    print("Running")
    run_ast(ast)

    print("---UNIQUIFICATION-----")
    uniquify(ast)
    print_ast(ast)
    print("Running")
    run_ast(ast)

    print("---Remove Complex Operands-----")
    remove_complex_operands(ast)
    print_ast(ast)
    print("Running")
    run_ast(ast)

if __name__ == '__main__':
    for x in range(1, len(sys.argv)):
        shulangable = sys.argv[x]
        if os.path.isfile(shulangable):
            run_case(shulangable)
        elif os.path.isdir(shulangable):
            files = sorted(os.listdir(shulangable))
            for file in files:      
                fp = os.path.join(shulangable, file)
                run_case(fp)
        else:
            print("I don't know what", shulangable, "is")
