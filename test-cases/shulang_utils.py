from shulang import *
from shared_utils import *
from sys import stdout

def print_ast(node : ASTNode, indentation = 0, file=stdout):
    print_indentation(indentation, file=file)
    match node:
        case ProgramNode():
            indentation = 0
            print("PROGRAM:", file=file)
            for node in node.children():
                print_ast(node, indentation + 1)
        case OperatorApplicationNode():
            print("OPERATOR(" + node.op + ")", file=file)
            print_ast(node.lhs, indentation + 1, file=file)
            print_ast(node.rhs, indentation + 1, file=file)
        case BindingNode():
            print("BIND(" + node.name + ") to", file=file)
            print_ast(node.value, indentation + 1)
        case VariableReferenceNode():
            print("REFERENCE(" + node.identifier + ")", file=file)
        case IntegerNode():
            print("INTEGER(" + str(node.value) + ")", file=file)
        case BooleanNode():
            print("BOOL(" + str(node.value) + ")", file=file)
        case IfNode():
            print("IF", file=file)
            print_ast(node.condition, indentation + 1, file=file)
            print_indentation(indentation, file=file)
            print("THEN", file=file)
            for x in node.then_block.nodes:
                print_ast(x, indentation + 1, file=file)

            print_indentation(indentation, file=file)
            if node.else_block != None:
                print("ELSE", file=file)
                for x in node.else_block.nodes:
                    print_ast(x, indentation + 1, file=file)

def graph_ast(node, parent='', file=stdout):
    match node:
        case ProgramNode():
            print("digraph ShuLangProgram {", file=file)
            for node in node.children():
                graph_ast(node, "program", file=file)
            print("}", file=file)
        case OperatorApplicationNode():
            my_node = graph_this_stuff(node.op, 1, parent, file=file)
            graph_ast(node.lhs, my_node, file=file)
            graph_ast(node.rhs, my_node, file=file)
            return my_node
        case NotNode():
            my_node = graph_this_stuff("not", 1, parent, file=file)
            graph_ast(node.value, my_node, file=file)
            return my_node
        case BeginNode():
            my_node = graph_this_stuff("begin", 1, parent, file=file)
            for statement in node.statements:
                graph_ast(statement, my_node, file=file)
            return graph_ast(node.end_value, my_node, file=file)
        case SelectOperatorNode():
            my_node = graph_this_stuff("if", 1, parent, file=file)
            graph_ast(node.condition, my_node, file=file)
            graph_ast(node.true_value, my_node, file=file)
            graph_ast(node.false_value, my_node, file=file)
            return my_node
        case BindingNode():
            my_node = graph_this_stuff("bind " + node.name + " : " + node.ty, 1, parent, file=file)
            graph_ast(node.value, my_node, file=file)
            return my_node
        case CallNode():
            my_node = graph_this_stuff('call ' + node.function_name,  1, parent, file=file)
            for arg in node.arguments:
                graph_ast(arg, my_node, file=file)
            return my_node
        case IntegerNode():
            my_node = graph_this_stuff(node.value, 1, parent, file=file)
            return my_node
        case BooleanNode():
            my_node = graph_this_stuff(node.value, 1, parent, file=file)
            return my_node
        case VariableReferenceNode():
            my_node = graph_this_stuff(node.identifier, 1, parent, file=file)
            return my_node
        case IfNode():
            my_node = graph_this_stuff("if", 1, parent, file=file)
            graph_ast(node.condition, my_node, file=file)

            count = 1
            parent = graph_this_stuff("then", 1, my_node, file=file)
            for child in node.then_block.nodes:
                count += 1
                graph_ast(child, parent, file=file)

            count = 1
            parent = graph_this_stuff("else", 1, my_node, file=file)

            if node.else_block != None:
                for child in node.else_block.nodes:
                    count += 1
                    graph_ast(child, parent, file=file)
                    
            return my_node
        case WhileNode():
            my_node = graph_this_stuff("while", 1, parent, file=file)
            graph_ast(node.condition, my_node, file=file)
            parent = graph_this_stuff("body", 1, my_node, file=file)
            for child in node.body.nodes:
                graph_ast(child, parent, file=file)


def get_value(node, env, stdin, file_name, stdout):
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
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs + rhs
                case '-':
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs - rhs
                case '*':
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs * rhs
                case '=':
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs == rhs
                case '!=':
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs != rhs
                case 'or':
                    if get_value(node.lhs, env, stdin, file_name, stdout):
                        return True
                    return get_value(node.rhs, env, stdin, file_name, stdout)
                case 'and':
                    if get_value(node.lhs, env, stdin, file_name, stdout):
                        return get_value(node.rhs, env, stdin, file_name, stdout)
                    return False
                case 'xor':
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs ^ rhs
                case '>':
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs > rhs
                case '>=':
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs >= rhs
                case '<':
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs < rhs
                case '<=':
                    lhs = get_value(node.lhs, env, stdin, file_name, stdout)
                    rhs = get_value(node.rhs, env, stdin, file_name, stdout)
                    return lhs <= rhs
                case '?':
                    if get_value(node.lhs, env, stdin, file_name, stdout):
                        return get_value(node.rhs, env, stdin, file_name, stdout)
                    return False
                case _:
                    print("Unrecognized operator", node.op)
                    exit(1)
        case NotNode():
            return not get_value(node.value, env, stdin, file_name, stdout)
        case BeginNode():
            for statement in node.statements:
                run_ast(statement, stdin, file_name, env, stdout)
            return get_value(node.end_value, env, stdin, file_name, stdout)
        case SelectOperatorNode():
            if get_value(node.condition, env, stdin, file_name, stdout):
                return get_value(node.true_value, env, stdin, file_name, stdout)
            return get_value(node.false_value, env, stdin, file_name, stdout)
        case CallNode():
            match node.function_name:
                case 'read_input':  
                    new_input = next(stdin, None)
                    if new_input == None:
                        print('Not enough inputs to stdin were provided for test:', file_name, stdout)
                        print('Either create ' + file_name + '.in or add more inputs')
                        exit(1)
                    return int(new_input) 

def run_ast(node, stdin, file_name, env, stdout):
    match node:
        case ProgramNode():
            for node in node.children():
                run_ast(node, stdin, file_name, env, stdout)
            return stdout
        case BindingNode():
            env[node.name] = get_value(node.value, env, stdin, file_name, stdout)
        case CallNode():
            match node.function_name:
                case 'print':
                    printable = get_value(node.arguments[0], env, stdin, file_name, stdout)
                    if str(printable) == "True":
                        printable = "true"
                    elif str(printable) == "False":
                        printable = "false"
                    verbose(printable)
                    stdout.append(printable)
                case 'read_input':
                    new_input = next(stdin, None)
                    if new_input == None:
                        print('Not enough inputs to stdin were provided for test:', file_name, stdout)
                        print('Either create ' + file_name + '.in or add more inputs')
                        exit(1)
                    return int(new_input)                    
                case _:
                    print('Unrecognized function:', node.function_name)
                    print('\tI am returning None for this call')
                    return None
        case IfNode():
            path = get_value(node.condition, env, stdin, file_name, stdout)
            if path:
                for x in node.then_block.nodes:
                    run_ast(x, stdin, file_name, env, stdout)
            elif node.else_block != None:
                for x in node.else_block.nodes:
                    run_ast(x, stdin, file_name, env, stdout)
        case WhileNode():
            path = get_value(node.condition, env, stdin, file_name, stdout)
            while get_value(node.condition, env, stdin, file_name, stdout):
                for x in node.body.nodes:
                    run_ast(x, stdin, file_name, env, stdout)
        case _:
            print("run_ast: unhandled " + node)
