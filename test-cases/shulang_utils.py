from shulang import *
from shared_utils import *

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
            if node.else_block != None:
                print("ELSE")
                for x in node.else_block.nodes:
                    print_ast(x, indentation + 1)

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
        case NotNode():
            my_node = graph_this_stuff("not", 1, parent)
            graph_ast(node.value, my_node)
            return my_node
        case BeginNode():
            my_node = graph_this_stuff("begin", 1, parent)
            for statement in node.statements:
                graph_ast(statement, my_node)
            return graph_ast(node.end_value, my_node)
        case SelectOperatorNode():
            my_node = graph_this_stuff("if", 1, parent)
            graph_ast(node.condition, my_node)
            graph_ast(node.true_value, my_node)
            graph_ast(node.false_value, my_node)
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
        case WhileNode():
            my_node = graph_this_stuff("while", 1, parent)
            graph_ast(node.condition, my_node)
            parent = graph_this_stuff("body", 1, my_node)
            for child in node.body.nodes:
                graph_ast(child, parent)


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
                case '?':
                    if get_value(node.lhs, env):
                        return get_value(node.rhs, env)
                    return False
                case _:
                    print("Unrecognized operator", node.op)
                    exit(1)
        case NotNode():
            return not get_value(node.value, env)
        case BeginNode():
            for statement in node.statements:
                run_ast(statement, env)
            return get_value(node.end_value, env)
        case SelectOperatorNode():
            if get_value(node.condition, env):
                return get_value(node.true_value, env)
            return get_value(node.false_value, env)

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
        case WhileNode():
            path = get_value(node.condition, env)
            while get_value(node.condition, env):
                for x in node.body.nodes:
                    run_ast(x, env, stdout)
