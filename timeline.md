# General timeline

This is subject to change.

## Act 4: Optimizations
Constant folding, constant propagation, and dead code elimination. I'm also introducing user input here.

## Act 5: Functions
You know what a function is, I know what a function is, it's time to have some fun compiling them.

## Act 6: Objects
Me when I need a VTable.

## Previous Acts

### Act 3: Loops
It's time to compile while loops! I did this act in 1 hour (loops are just fancy GOTO's) but this the last thing I did before my university started so I think it's fine to call it an act.

### Parser changes
Shouldn't be that hard. The grammar for loop construct is as follows:

while ::= "while" value body
- I'll do a for loop if someone can give me good notation
- No I'm not doing `;;` 

### Type checking
Making sure that the condition of the while loop is a boolean, everything else is the same

### Remove complex operands
If and while loop conditions don't have to be atomic anymore as we can levarage the begin node

### Select SIR instructions
I am jumping around at the speed of sound

### Select LLVM instructions
I had to modify how I'm inserting Phi nodes. Basically I just insert the node then wait to add the incoming values until everything else has been done.

And that's it! You'll notice that the changes don't seem that numerous. That's probably because I'm forgetting something, but also is because I'm only adding a single construct to my language. Said construct also doesn't change the IR which is nice.

### INTERMISSION: Cleanup AST and Tester

My ShuLang visitor AND AST is a mess and I must clean it up. Here's why I want to do:
- [x] ASTNodes ingress/egress should call a virtual "ingress step" or "egress step" when being ingressed/egressed, THEN call `visitor->ingressNode` or `visitor->egressNode` so I'm not seemingly returning a random value
- [x] ASTNodes's need more constructors. `ValueNode`'s not taking in a type is fine in ShuLang, but some things are weird
- [x] Change some smart pointers to raw pointers (pybind11 hates unique pointers so I'm still going to use shared pointers)
- [x] Rename `namespace shuir` to `namespace sir`.
- [x] Update ShuLang/SIR specs
- [x] Split the tester into multiple files, e.g. ShuLang, SIR, and a driver file

### Act 2: Conditionals
Here I'll introduce the `if` and `true` and `false` stuff, as well as the funny boolean operators (e.g. `and`).

### Parser changes
Now we have a construct that has a body, meaning I need a `parse_body` function. This functions check if there's a `{`, and if so parses a sequence of statement, other wise parses a single statement.

I also changed how operators get parsed in order to make it more extensible. Basically as I was going up in precedence I hard coded a massive `if (op == "op" ||...)` and manually passed through the next function. Now I have everything in an array and it's super easy to add new operators.

I also wrote an operator precedence function for `not` and ternary `if`.

### Type checking
Everything in ShuLang before was an Integer, but in order to implement conditionals we need to implement a type checker. I'll just do the standard bidirectional "do I synthesize or check a type :O"

### Deprecated Pass: Uniquification
This pass is not being used anymore because I don't think that it's necesary to lower to SSA.

### New pass: Short Circuit-ification
In the Racket programming langauge, the expression `(and lhs rhs)` if just a macro for `(if lhs rhs #f)` And similarly `(or lhs rhs)` becomes `(if lhs #t rhs)`. This is useful because it allows for short circuiting, where we only evaluate the right hand side when we need to. The side effect of this change is we're introducing a new jump instruction, and as we know jump instructions are slow. 

If the `rhs` is an atomic value (variable reference, true, or false) then short circuiting because useless, as the `rhs` is already evalutated as ShuLang is call-by value. Hence instead of inserting a new block, we'll leave it as is and use the SIR `cmp` instructions.

I made the ternary opeerator so I could do this pass as without there's going to be code dupliation (consider the expression `and (or true false) (and true false))`).

### Remove complex operands
We have to make sure that the condition of the if is not complex. We also make sure ternary operators have no complex values through utilization a "begin node". These nodes can store some statements to run beforehand, but will ultimately return a final value. 

### Select SIR instructions
The first pass that's different in a meaningful way. 

When I encounter an if statement I must create a block for the condition portion of the if statement, the "then" portion, another for an "else" portion if it exists, and also a block for the continuation if it exists. The newly created blocks should then jump to the continuation or an "exit" block, which means I have to create an exit block

I also translate `true` to `1` and `false` to `0`. The type checker assures that this is okay.

One other thing I took the liberty of doing is making SIR actually SSA, which means that I had to insert phi nodes (see [here](https://en.wikipedia.org/wiki/Static_single-assignment_form) for more information) in a bunch of places. However, we can't know what predecesor blocks could contain the variable we're looking for yet, so instead we insert a "pseudo phi node" and make it a real phi node (or instead just make it a reference) in the next pass.

If ternaries get translated into jumps which allows for lazy evaluation.

### Promote Pseudo Phi
This pass required me to create a [CFG](https://en.wikipedia.org/wiki/Control-flow_graph) (CFG is slang for control flow graph btw), so I did that. 

The procedure for this pass is:
1. Push all terminal blocks onto a queue
2. Pop some block from the queue
3. If a Pseudo phi is found, then check all predecessor blocks
    - If a predecessor contains the binding we're looking for, add it to a real phi node
    - If it doesn't, then create a pseudo phi node as the first instruction of the predecessor block
4. Push all predecessor blocks onto the queue
5. Continue until the queue is empty

More simply check the "previous" blocks for a particular binding. If the binding doesn't exist, add a pseudo phi node as the binding. We'll revisit the block later and promote said pseudo phi node. The pass starts at the "end", then goes backwards in a BFS fashion.

Of course if there's only one predecesor block we instead insert new binding that's just a reference to the previous binding.

### Select LLVM instructions
Yeah so I just call the right IR builder stuff and it works!!!!!!!!

I found out that I can disable constant folding, so instead of creating alloca's I juset reference a dictionary I create. Hence me having to use the CFG again! This time the pass go forwards in a BFS fashion, and only visits blocks if their predecessors have been visited. Maybe there's a more memory effecient way to do this, but I'll 
worry about that later.

### INTERMISSION: General cleanup and making pointers smart
Here I separated some class definitions and declarations and used `shared_ptr`'s inside of ASTNodes instead of raw pointers. pybind11 doesn't play nice with unique pointers, hence me using shared ones instead; however if I ever decide to reorder instructions I'm sure it'll be easier to do with shared pointers instead of having to call move millions of times.

I also realized that the way I was parsing nodes was doing right to left associativity instead of left to right, hence I had to fix that. I also added the `*` and binary `-` operator (which means if you want to declare a negative number you need to do `0 - number` as there's no unary version).

This took a LONG time because I had to fix the parser and I spent a long time thinking about how associativity should work.


###  Act 1: Arithmetic, Integers, and Variables
Simple arithmetic is now functioning, meaning we have variable bindings as well as addition, multiplication, subtract, and printing.

Here are the passes used:
1. Uniquify Variable Names
    - In Uniquify Variable Names, all variables will be assigned an unique name (shocker :O)

2. Remove Complex Operands
    - There's this idea of [three address code](https://en.wikipedia.org/wiki/Three-address_code), [A-normal form](https://en.wikipedia.org/wiki/A-normal_form) (somethimes jokingly called Amr normal form after its creator), and [Continuation Passing Style](https://en.wikipedia.org/wiki/Continuation-passing_style) as an IR. Before we go to an IR however, we'll want to make sure that no operator has operands with operators. The official name for the normal form we get into is "Monadic Normal Form", however I can not find a good source that explains what it is so go down the rabbit hole dear reader.
3. SIR Instruction Selection
    - In this pass we lower to SSA. No optimizations are done currently, however constant folding is planned for when I get to loops.
4. LLVM Instruction Selection
    - SIR gets lowered to LLVM. We also declare `printf` and insert `"%d\n` format specifier in this pass.
