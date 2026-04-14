from sys import stdout

VERBOSE = False

def set_verbose(verbose: bool) -> None:
    global VERBOSE
    VERBOSE = verbose

def print_indentation(indentation, file=stdout):
    if indentation > 0:
        print(" " * indentation * 2, end='', file=file)


node_counter = 0
def graph_this_stuff(label, indentation, parent=None, name=None, file=stdout):
    global node_counter
    
    if name is None:
        name = "node" + str(node_counter)
        node_counter += 1
        
    label_str = name + '[label="' + str(label) + '"]'
    print_indentation(indentation, file=file)
    print(label_str, file=file)

    if parent != None:
        print_indentation(indentation, file=file)
        print(parent, "->", name, file=file)

    return name

def verbose(*args, **kwargs):
    if VERBOSE:
        print(*args, **kwargs)