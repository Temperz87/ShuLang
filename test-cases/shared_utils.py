def print_indentation(indentation):
    if indentation > 0:
        print(" " * indentation * 2, end='')


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
