from shulang import *
from shared_utils import *

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
        case PseudoPhiNode():
            return "pseudoΦ " + node.requested_previous
        case PhiNode():
            ret = "Φ "
            for block_name, val in node.candidates:
                ret += "[" + block_name + ", " + stringify_value(val) + "] "
            return ret
        case SelectNode():
            return "Select (" + stringify_value(node.condition) +  ") (" + stringify_value(node.true_value) + \
                             " (" + stringify_value(node.false_value) + ")"
        case SIRInputNode():
            return 'read_input()'
        case _:
            print("Unknown value", node)
            exit(1)


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

def get_sir_value(node, last_block, env, stdin):
    match node:
        case ImmediateNode():
            return node.number
        case ReferenceNode():
            return env[node.identifier]
        case PseudoPhiNode():
            print(env, node.requested_previous)
            return env[node.requested_previous]
        case PhiNode():
            for block_name, val in node.candidates:
                if block_name == last_block.name:
                    return get_sir_value(val, last_block, env, stdin)
        case SelectNode():
            if get_sir_value(node.condition, last_block, env, stdin):
                return get_sir_value(node.true_value, last_block, env, stdin)
            return get_sir_value(node.false_value, last_block, env, stdin)
        case AddNode():
            lhs = get_sir_value(node.lhs, last_block, env, stdin)
            rhs = get_sir_value(node.rhs, last_block, env, stdin)
            return lhs + rhs
        case SubNode():
            lhs = get_sir_value(node.lhs, last_block, env, stdin)
            rhs = get_sir_value(node.rhs, last_block, env, stdin)
            return lhs - rhs
        case MultNode():
            lhs = get_sir_value(node.lhs, last_block, env, stdin)
            rhs = get_sir_value(node.rhs, last_block, env, stdin)
            return lhs * rhs
        case CmpNode():
            lhs = get_sir_value(node.lhs, last_block, env, stdin)
            rhs = get_sir_value(node.rhs, last_block, env, stdin)
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
            return next(stdin)
        case _:
            print("Unsupported sir value:", node)
            exit(2)

def run_sir_block(block, blocks, last_block, env, stdout, stdin):
    for instruction in block.instructions:
        match instruction:
            case ExitNode():
                break
            case SIRPrintNode():
                val = get_sir_value(instruction.to_print, last_block, env, stdin)
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
                val = get_sir_value(instruction.binding, last_block, env, stdin)
                env[instruction.identifier] = val
                for k, v in block.variable_to_ref.items():
                    if v in env:
                        env[k] = env[v]
            case JumpIfElseNode():
                val = get_sir_value(instruction.condition, last_block, env, stdin)
                if val:
                    return run_sir_block(instruction.destination, blocks, block, env, stdout, stdin)
                else:
                    return run_sir_block(instruction.else_destination, blocks, block, env, stdout, stdin)
            case JumpNode():
                return run_sir_block(instruction.destination, blocks, block, env, stdout, stdin)
    return stdout

def run_sir_program(program_node, stdin):
    for block in program_node.blocks:
        if block.name == 'main':
            return run_sir_block(block, program_node.blocks, "", {}, [], stdin)
