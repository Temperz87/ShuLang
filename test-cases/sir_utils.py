from shulang import *
from shared_utils import *

def width_to_type(width : int):
    match width:
        case 32:
            return 'i32'
        case 0:
            return 'void'
        case 1:
            return 'boolean'
        case _:
            return 'unknown_type'

def stringify_value(node):
    match node:
        case ImmediateNode():
            return "$" + str(node.number)
        case ReferenceNode():
            return "%" + node.definition.identifier
        case AddNode():
            return stringify_value(node.lhs) + " + " + stringify_value(node.rhs)
        case SubNode():
            return stringify_value(node.lhs) + " - " + stringify_value(node.rhs)
        case MultNode():
            return stringify_value(node.lhs) + " * " + stringify_value(node.rhs)
        case CmpNode():
            return stringify_value(node.lhs) + " " + node.op + " " + stringify_value(node.rhs)
        case PseudoPhiNode():
            return "pseudoΦ " + node.requested_previous
        case PhiNode():
            ret = "Φ "
            for block_name, val in node.candidates:
                ret += "[" + block_name.name + ", " + stringify_value(val) + "] "
            return ret
        case SelectNode():
            return "Select (" + stringify_value(node.condition) +  ") (" + stringify_value(node.true_value) + \
                             " (" + stringify_value(node.false_value) + ")"
        case SIRInputNode():
            return 'read_input()'
        case SIRCallNode():
            ret = node.function.name + '('
            coma = False
            for arg in node.arguments:
                if not coma:
                    coma = True
                else:
                    ret += ', '          
                ret += stringify_value(arg)
            
            ret += ')'
            return ret
        case _:
            raise Exception("stringify_value: Unknown value " + str(node))
            


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
        case ExitNode():
            return 'exit'
        case SIRReturnNode():
            return 'return ' + stringify_value(instruction.return_value)
        case _:
            raise RuntimeError("Umimplemented SIR graph string: " + str(instruction))
        

def graph_function(function, file=stdout):
    jumpnodes = []
    print_indentation(1, file=file)
    print("subgraph cluster_" + function.name + " {", file=file)
    print_indentation(2, file=file)
    function_label = width_to_type(function.return_width) + ' ' + function.name + '('
    comma = False
    for param in function.parameters:
        if not comma:
            comma = True
        else:
            function_label += ', '

        function_label += width_to_type(param.width) + ' %' + param.identifier
    
    function_label += ")"
    print('label = "' + function_label + '";', file=file)
    for block in function.blocks:
        print_indentation(2, file=file)
        print("subgraph cluster_" + block.name + " {", file=file)

        print_indentation(3, file=file)
        print('label = "' + block.name + '";', file=file)

        if len(block.instructions) == 0:
            print_indentation(1, file=file)
            print('}', file=file)
            continue

        current = None
        for instruction in block.instructions:
            # For our first instruction
            if current == None:
                current = graph_this_stuff(get_sir_graph_string(instruction), 3, current, name=function.name + '_first_' + block.name, file=file)
            else:
                current = graph_this_stuff(get_sir_graph_string(instruction), 3, current, file=file)

            match instruction:
                case JumpIfElseNode():
                    jumpnodes.append((current, instruction.destination.name))
                    jumpnodes.append((current, instruction.else_destination.name))
                case JumpNode():
                    jumpnodes.append((current, instruction.destination.name))

        print_indentation(2, file=file)
        print('}', file=file)

    for source, destination in jumpnodes:
        print_indentation(2, file=file)
        print(source + ' -> ' + function.name + '_first_' + destination, file=file)

    print_indentation(1, file=file)
    print('}', file=file)

def graph_sir_program(program, file=stdout):
    print("digraph SIRProgram {", file=file)
    for function in program.functions:
        graph_function(function, file)
    
    print("}", file=file)


def print_sir_ast(node, indentation = 0, file=stdout):
    if indentation > 0:
        print("  " * indentation, end='')
    # print("Discovered node", node)
    match node:
        case SIRProgramNode():
            print("SIRProgram", file=file)
            indentation += 1
            for block in node.blocks:
                print("  " * indentation, block.name + "(" + str(len(block.instructions)) + "):", file=file)
                for node in block.instructions:
                    print_sir_ast(node, indentation + 1, file=file)
        case SIRPrintNode():
            print("PRINT", stringify_value(node.to_print), file=file)
        case DefinitionNode():
            print(node.identifier, "<-", stringify_value(node.binding), file=file)
        case JumpIfElseNode():
            print("jump to " + node.destination.name + " if " + stringify_value(node.condition) \
                             + " else jump to " + node.else_destination.name, file=file)
        case JumpNode():
            print("jump to " + node.destination.name, file=file)
        case _:
            print("Unknown definition", node)
            exit(1)


def run_sir_function(function, env, functions, stdout, stdin):
    pass

def get_sir_value(node, last_block, env, functions, stdout, stdin):
    if env == None:
        raise RuntimeError("ENV IS NONE!!")
    match node:
        case ImmediateNode():
            return node.number
        case ReferenceNode():
            return env[node.definition.identifier]
        case PseudoPhiNode():
            print('Encountered a pseudo phi node')
            print('\tDid you run promote pseudo phi first?')
            raise RuntimeError()
        case PhiNode():
            for block, val in node.candidates:
                if block.name == last_block.name:
                    return get_sir_value(val, last_block, env, functions, stdout, stdin)
        case SelectNode():
            if get_sir_value(node.condition, last_block, env, functions, stdout, stdin):
                return get_sir_value(node.true_value, last_block, env, functions, stdout, stdin)
            return get_sir_value(node.false_value, last_block, env, functions, stdout, stdin)
        case AddNode():
            lhs = get_sir_value(node.lhs, last_block, env, functions, stdout, stdin)
            rhs = get_sir_value(node.rhs, last_block, env, functions, stdout, stdin)
            return lhs + rhs
        case SubNode():
            lhs = get_sir_value(node.lhs, last_block, env, functions, stdout, stdin)
            rhs = get_sir_value(node.rhs, last_block, env, functions, stdout, stdin)
            return lhs - rhs
        case MultNode():
            lhs = get_sir_value(node.lhs, last_block, env, functions, stdout, stdin)
            rhs = get_sir_value(node.rhs, last_block, env, functions, stdout, stdin)
            return lhs * rhs
        case CmpNode():
            lhs = get_sir_value(node.lhs, last_block, env, functions, stdout, stdin)
            rhs = get_sir_value(node.rhs, last_block, env, functions, stdout, stdin)
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
        case SIRInputNode():
            new_input = next(stdin, None)
            if new_input == None:
                print('Not enough input to stdin were provided for the test case', stdout)
                print('\tThis means that an input node got duplicated')
                exit(1)

            return int(new_input)
        case SIRCallNode():
            # Create a new env, so we don't scoop up variables
            function_env = {}
            for arg, param in zip(node.arguments, node.function.parameters):
                function_env[param.identifier] = get_sir_value(arg, last_block, env, functions, stdout, stdin)
            
            return run_sir_function(node.function, function_env, functions, stdout, stdin)
        case _:
            raise Exception("Unsupported sir value: " + str(node))

def run_sir_block(block, blocks, last_block, env, functions, stdout, stdin):
    for instruction in block.instructions:
        match instruction:
            case ExitNode():
                break
            case SIRPrintNode():
                val = get_sir_value(instruction.to_print, last_block, env, functions, stdout, stdin)
                match instruction.print_type:
                    case 'Integer':
                        verbose(val)
                        stdout.append(str(val).lower())
                    case 'Boolean':
                        if val == 1:
                            verbose('true')
                            stdout.append('true')
                        elif val == 0:
                            verbose('false')
                            stdout.append('false')
                        else:
                            print('Val was', val, 'which is not a boolean?')
                    case _:
                        print("Unsupported print type found in a SIRPrintNode:", instruction.print_type)
                
            case DefinitionNode():
                val = get_sir_value(instruction.binding, last_block, env, functions, stdout, stdin)
                env[instruction.identifier] = val
                for k, v in block.variable_to_ref.items():
                    if v in env:
                        env[k] = env[v]
            case JumpIfElseNode():
                val = get_sir_value(instruction.condition, last_block, env, functions, stdout, stdin)
                if val:
                    return run_sir_block(instruction.destination, blocks, block, env, functions, stdout, stdin)
                else:
                    return run_sir_block(instruction.else_destination, blocks, block, env, functions, stdout, stdin)
            case JumpNode():
                return run_sir_block(instruction.destination, blocks, block, env, functions, stdout, stdin)
            case SIRReturnNode():
                return get_sir_value(instruction.return_value, last_block, env, functions, stdout, stdin)
            
    return stdout

def run_sir_function(function, env, functions, stdout, stdin):
    for block in function.blocks:
        if block.name == 'entry':
            return run_sir_block(block, function.blocks, None, env, functions, stdout, stdin)

def _run_sir_program(program_node, stdin):
    functions = {}
    for function in program_node.functions:
        functions[function.name] = function

    for function in program_node.functions:
        if function.name == 'main':
            ret = run_sir_function(function, {}, functions, [], stdin)
            if len(list(stdin)) != 0:
                print("\nAll input was not consumed!")
                print("There's probably a problem with an optimization...")
                raise RuntimeError()
            
            return ret
            
def run_sir_program(sir_program, stdin, pass_name, file_name):
    try:
        return _run_sir_program(sir_program, iter(stdin))
    except:
        print('Encountered error while running program for file\n\t' + str(file_name))
        with open(f'./failure {pass_name}.dot', 'w') as fd:
            graph_sir_program(sir_program, file=fd)

        raise
    