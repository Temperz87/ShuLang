import os
import sys
from shulang import *
import subprocess

def print_indentation(indentation):
    if indentation > 0:
        print(" " * indentation * 2, end='')

def print_ast(node : ASTNode, indentation = 0):
    print_indentation(indentation)
    match node:
        case ProgramNode():
            indentation = 0
            print("PROGRAM:")
            for node in node.children():
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
        case BooleanNode():
            print("BOOL(" + str(node.value) + ")")
        case PrintNode():
            print("PRINT")
            print_ast(node.to_print, indentation + 1)
        case IfNode():
            print("IF")
            print_ast(node.condition, indentation + 1)
            print_indentation(indentation)
            print("THEN")
            for x in node.then_block.nodes:
                print_ast(x, indentation + 1)
            print_indentation(indentation)
            print("ELSE")
            for x in node.else_block.nodes:
                print_ast(x, indentation + 1)

node_counter = 0
def graph_this_stuff(label, indentation, parent=None, name=None):
    global node_counter
    
    if name is None:
        name = "node" + str(node_counter)
        node_counter += 1
        
    label_str = name + '[label="' + str(label) + '"]'
    print_indentation(indentation)
    print(label_str)

    if parent != None:
        print_indentation(indentation)
        print(parent, "->", name)

    return name


def graph_ast(node, parent=''):
    match node:
        case ProgramNode():
            print("digraph ShuLangProgram {")
            for node in node.children():
                graph_ast(node, "program")
            print("}")
        case OperatorApplicationNode():
            my_node = graph_this_stuff(node.op, 1, parent)
            graph_ast(node.lhs, my_node)
            graph_ast(node.rhs, my_node)
            return my_node
        case BindingNode():
            my_node = graph_this_stuff("bind " + node.name + " : " + node.ty, 1, parent)
            graph_ast(node.value, my_node)
            return my_node
        case PrintNode():
            my_node = graph_this_stuff("print", 1, parent)
            graph_ast(node.to_print, my_node)
            return my_node
        case IntegerNode():
            my_node = graph_this_stuff(node.value, 1, parent)
            return my_node
        case BooleanNode():
            my_node = graph_this_stuff(node.value, 1, parent)
            return my_node
        case VariableReferenceNode():
            my_node = graph_this_stuff(node.identifier, 1, parent)
            return my_node
        case IfNode():
            my_node = graph_this_stuff("if", 1, parent)
            graph_ast(node.condition, my_node)

            count = 1
            parent = graph_this_stuff("then", 1, my_node)
            for child in node.then_block.nodes:
                count += 1
                graph_ast(child, parent)

            count = 1
            parent = graph_this_stuff("else", 1, my_node)

            if node.else_block != None:
                for child in node.else_block.nodes:
                    count += 1
                    graph_ast(child, parent)
                    
            return my_node

def get_value(node, env):
    match node:
        case IntegerNode():
            return node.value
        case BooleanNode():
            return node.value
        case VariableReferenceNode():
            if node.identifier not in env:
                print(node.identifier, "was not found!")
                print("\tIn env:", env)
                exit(1)
            
            return env[node.identifier]
        case OperatorApplicationNode():
            match node.op:
                case '+':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs + rhs
                case '-':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs - rhs
                case '*':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs * rhs
                case '=':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs == rhs
                case '!=':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs != rhs
                case 'or':
                    if get_value(node.lhs, env):
                        return True
                    return get_value(node.rhs, env)
                case 'and':
                    if get_value(node.lhs, env):
                        return get_value(node.rhs, env)
                    return False
                case 'xor':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs ^ rhs
                case '>':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs > rhs
                case '>=':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs >= rhs
                case '<':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs < rhs
                case '<=':
                    lhs = get_value(node.lhs, env)
                    rhs = get_value(node.rhs, env)
                    return lhs <= rhs
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
            if str(printable) == "True":
                printable = "true"
            elif str(printable) == "False":
                printable = "false"
            print(printable)
            stdout.append(printable)
        case IfNode():
            path = get_value(node.condition, env)
            if path:
                for x in node.then_block.nodes:
                    run_ast(x, env, stdout)
            elif node.else_block != None:
                for x in node.else_block.nodes:
                    run_ast(x, env, stdout)

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
        case CmpNode():
            return stringify_value(node.lhs) + " " + node.op + " " + stringify_value(node.rhs)
        case _:
            print("Unknown value", node)
            exit(1)

def print_sir_ast(node, indentation = 0):
    if indentation > 0:
        print("  " * indentation, end='')
    # print("Discovered node", node)
    match node:
        case SIRProgramNode():
            print("SIRProgram")
            indentation += 1
            for block in node.blocks:
                print("  " * indentation, block.name + "(" + str(len(block.instructions)) + "):")
                for node in block.instructions:
                    print_sir_ast(node, indentation + 1)
        case SIRPrintNode():
            print("PRINT", stringify_value(node.to_print))
        case DefinitionNode():
            print(node.identifier, "<-", stringify_value(node.binding))
        case JumpIfElseNode():
            print("jump to " + node.destination.name + " if " + stringify_value(node.condition) + " else jump to " + node.else_destination.name)
        case JumpNode():
            print("jump to " + node.destination.name)
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
            lhs = get_sir_value(node.lhs, env)
            rhs = get_sir_value(node.rhs, env)
            return lhs + rhs
        case SubNode():
            lhs = get_sir_value(node.lhs, env)
            rhs = get_sir_value(node.rhs, env)
            return lhs - rhs
        case MultNode():
            lhs = get_sir_value(node.lhs, env)
            rhs = get_sir_value(node.rhs, env)
            return lhs * rhs
        case CmpNode():
            lhs = get_sir_value(node.lhs, env)
            rhs = get_sir_value(node.rhs, env)
            match node.op:
                case "<":
                    ret = lhs < rhs
                case "<=":
                    ret = lhs <= rhs
                case "=":
                    ret = lhs == rhs
                case "!=":
                    ret = lhs != rhs
                case ">":
                    ret = lhs > rhs
                case ">=":
                    ret = lhs >= rhs
                case "and":
                    ret = lhs and rhs
                case "or":
                    ret = lhs or rhs
                case "xor":
                    ret = lhs ^ rhs
            
            if ret:
                return 1
            return 0

def run_sir_block(block, blocks, env, stdout):
    for instruction in block.instructions:
        match instruction:
            case SIRPrintNode():
                val = get_sir_value(instruction.to_print, env)
                match instruction.print_type:
                    case 'Integer':
                        print(val)
                        stdout.append(str(val).lower())
                    case 'Boolean':
                        if val == 1:
                            print('true')
                            stdout.append('true')
                        elif val == 0:
                            print('false')
                            stdout.append('false')
                        else:
                            print('Val was', 0, 'which is not a boolean?')
                    case _:
                        print("Unsupported print type found in a SIRPrintNode:", instruction.print_type)
                
            case DefinitionNode():
                val = get_sir_value(instruction.binding, env)
                env[instruction.identifier] = val
            case JumpIfElseNode():
                val = get_sir_value(instruction.condition, env)
                if val:
                    return run_sir_block(instruction.destination, blocks, env, stdout)
                else:
                    return run_sir_block(instruction.else_destination, blocks, env, stdout)
            case JumpNode():
                return run_sir_block(instruction.destination, blocks, env, stdout)
    return stdout

def run_sir_program(program_node):
    for block in program_node.blocks:
        if block.name == 'main':
            return run_sir_block(block, program_node.blocks, {}, [])

def get_sir_graph_string(instruction):
    match instruction:
        case SIRPrintNode():
            return 'print ' + stringify_value(instruction.to_print)
        case DefinitionNode():
            return '%' + instruction.identifier + ' <- ' + stringify_value(instruction.binding)
        case JumpIfElseNode():
            return 'jump to ' + instruction.destination.name + ' if ' + stringify_value(instruction.condition) + ' else jump to ' + instruction.else_destination.name
        case JumpNode():
            return 'jump to ' + instruction.destination.name

def graph_sir_program(program_node):
    print("digraph SIRProgram {")

    jumpnodes = []
    for block in program_node.blocks:
        print_indentation(1)
        print("subgraph cluster_" + block.name + " {")

        print_indentation(2)
        print('label = "' + block.name + '";')

        if len(block.instructions) == 0:
            print_indentation(1)
            print('}')
            continue

        current = None
        for instruction in block.instructions:
            # For our first instruction
            if current == None:
                current = graph_this_stuff(get_sir_graph_string(instruction), 2, current, name='first_' + block.name)
            else:
                current = graph_this_stuff(get_sir_graph_string(instruction), 2, current)
            match instruction:
                case JumpIfElseNode():
                    jumpnodes.append((current, instruction.destination.name))
                    jumpnodes.append((current, instruction.else_destination.name))
                case JumpNode():
                    jumpnodes.append((current, instruction.destination.name))

        print_indentation(1)
        print('}')

    for source, destination in jumpnodes:
        print_indentation(1)
        print(source + ' -> first_' + destination)

    print("}")

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
            print("Error during compilation of", filename)
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
    # graph_ast(ast)
    print("Type checking...")
    type_check(ast)
    print("Running...")
    parse_stdout = run_ast(ast, {}, [])
    compare_stdout(expected_stdout, parse_stdout, file_name, "parsing")

    print("---UNIQUIFICATION---")
    uniquify(ast)
    # print_ast(ast)
    # graph_ast(ast)k
    print("Running...")
    uniquify_stdout = run_ast(ast, {}, [])
    compare_stdout(expected_stdout, uniquify_stdout, file_name, "uniquify")

    # print("---SHORT CIRCUIT-IFICATION")
    # TODO: Finish this pass!!!
    # short_circuitify(ast)
    # print_ast(ast)
    # graph_ast(ast)
    # print("Type checking...")
    # type_check(ast)
    # print("Running...")
    # short_stdout = run_ast(ast, {}, [])
    # compare_stdout(expected_stdout, short_stdout, file_name, "uniquify")

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
    print("Running")
    select_stdout = run_sir_program(sir_program)
    compare_stdout(expected_stdout, select_stdout, file_name, "select SIR instructions")
    return

    print("---SELECT LLVM INSTRUCTIONS---")
    select_llvm(sir_program, file_name, 'a.ll')
    subprocess.run("clang a.ll -o a.out", shell=True)
    output = subprocess.run("./a.out", shell=True, capture_output=True)
    output_stdout = output.stdout.decode("utf-8")[0:-1].split("\n")
    os.system("rm -f a.ll a.out")

    compare_stdout(expected_stdout, output_stdout, file_name, "select LLVM instructions")

    print("Test", file_name, "passed")

if __name__ == '__main__':
    tests_ran = 0
    if len(sys.argv) == 1:
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
                if fp[-3:] != '.sl':
                    continue

                run_case(fp)
                print()
                tests_ran += 1
        else:
            print("I don't know what", shulangable, "is")

    if tests_ran > 0:
        print(tests_ran, "tests passed. Good job!")
