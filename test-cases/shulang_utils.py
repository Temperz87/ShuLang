from shulang import *
from shared_utils import *
from sys import stdout

def run_ast(node, stdin, file_name, env, stdout):
    pass

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
        case FunctionNode():
            param_names = [x + ' : ' + y for x,y in node.parameters]
            func_name = node.name + '(' + ', '.join(param_names) + ')'
            my_node = graph_this_stuff(func_name + ' -> ' + node.return_type \
                                                 , 1, parent, file=file)
            for child in node.body.nodes:
                graph_ast(child, my_node, file=file)
        case ReturnNode():
            my_node = graph_this_stuff('return', 1, parent, file=file)
            graph_ast(node.return_value, my_node, file=file)


def get_function_value(func_node, arguments, env, stdin, file_name, stdout):
    # extend env
    func_env = env.copy()
    for (name, _), value in zip(func_node.parameters, arguments):
        func_env[name] = get_value(value, env, stdin, file_name, stdout)

    for node in func_node.body.nodes:
        ret = run_ast(node, stdin, file_name, func_env, stdout)
        if ret != None:
            return ret


def get_value(node, env, stdin, file_name, stdout):
    match node:
        case IntegerNode():
            return node.value
        case BooleanNode():
            return node.value
        case VariableReferenceNode():
            if node.identifier not in env:
                exception_message = node.identifier, "was not found!" + \
                                    "\n\tIn env: " + str(env)
                raise Exception(exception_message)
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
            if node.function_name == 'read_input':  
                new_input = next(stdin, None)
                if new_input == None:
                    print('Not enough inputs to stdin were provided for test:', file_name, stdout)
                    print('Either create ' + file_name + '.in or add more inputs')
                    exit(1)
                
                return int(new_input) 
            elif node.function_name in env:
                func = env[node.function_name]
                return get_function_value(func, node.arguments, env, stdin, file_name, stdout)
            else:
                raise Exception('Unrecognized function: ' + node.function_name)

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
                    if node.function_name in env:
                        func = env[node.function_name]
                        return get_function_value(func, node.arguments, env, stdin, file_name, stdout)
                    else:
                        raise Exception('Unrecognized function:', node.function_name)
                    
        case IfNode():
            path = get_value(node.condition, env, stdin, file_name, stdout)
            if path:
                for x in node.then_block.nodes:
                    ret = run_ast(x, stdin, file_name, env, stdout)
                    if ret != None:
                        return ret
            elif node.else_block != None:
                for x in node.else_block.nodes:
                    ret = run_ast(x, stdin, file_name, env, stdout)
                    if ret != None:
                        return ret
        case WhileNode():
            path = get_value(node.condition, env, stdin, file_name, stdout)
            while get_value(node.condition, env, stdin, file_name, stdout):
                for x in node.body.nodes:
                    ret = run_ast(x, stdin, file_name, env, stdout)
                    if ret != None:
                        return ret
        case FunctionNode():
            env[node.name] = node
        case ReturnNode():
            # We could validate that we are in a function context
            # But the type checker already does that
            return get_value(node.return_value, env, stdin, file_name, stdout)
        case _:
            raise Exception("run_ast unhandled: " + node)
