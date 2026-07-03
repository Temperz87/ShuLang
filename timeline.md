# General timeline

This is subject to change.

## Act 5: Functions
You know what a function is, I know what a function is, it's time to have some fun compiling them.

## Act 6: Objects
Me when I need a VTable.

## Previous Acts

## Act 4: Optimizations
The original plan was to only do constant folding, constant propagation, and dead code elimination, however things quickly derailed because of not being able to solely focus on the project. At the end of this, the following optimizations were working:
- Sparse Conditional Constant Propagation
- Constant folding
    - Basically arithmetic identifies like "x + 0 = x"
- CFG Simplification
    - e.g. Changing instructions in the form of "jump to then5 if true else jump to else6" to be "jump to then5" 
- CFG Block Merging
    - Merging trivial blocks
- Dead Store Elimination

With all of the features currently in the language, we can constant fold EVERY program to just be "print thing". Hence before we start optimizing, it's time to add user input. This shouldn't be too hard on its own, so let's also add a little bit to this to start supporting functions. Now we can add function calls into ShuLang, but not have a way for users to define functions yet.

`statement ::= identifier()`

`value ::= identifier()`

We can now get rid of ShuLang's (not SIR's) print AST node in favor of function call nodes. Type checking will have to check arity as well as set argument type. RCO shall of course treat function calls (right now only `print` and `read_input`) as complex values. 

The parser was in such a bad state when it came to parsing precedence that when I tried parsing functions everything broke. Instead of doing "parse_term_hi" and "parse_term_low" nonsense I didn't understand, it now does [operator precedence climbing](https://en.wikipedia.org/wiki/Operator-precedence_parser#Precedence_climbing_method)!

Instruction selection is where things get interesting as `print` and `read_input` have a lot abstracted away. For example in C's `printf` (what ShuLang is levaraging for print nodes), a string containing the format of how to print a value is the first argument; however avid ShuLang users (all 0 of them) won't have to deal with this, because shuc will place it for them. To help out LLVM lowering, what we'll do is translate all calls to `print` to a `PrintNode` (which is what we did before), and similarly all calls to `read_input` to an `InputNode`. Notably `InputNode` is a value NOT an instruction, so we'll also place a definition and which gets bound to the result of `read_input` return a reference to said definition.

Lowering `PrintNode`'s hasn't changed, but for lowering `InputNode`'s we first create a global format ` %d` (note the space before the `%d`), then call [one of C's most unsafe functions `scanf`](https://sekrit.de/webdocs/c/beginners-guide-away-from-scanf.html). Technically this means that, at this moment, ShuLang is now an unsafe programming language! An alloca is needed to store the output of `scanf`, because it returns how many fields got scanned in not its input. With all of this mess, user input is now working!

I also succumbed to [feature creep](https://en.wikipedia.org/wiki/Feature_creep), because I appearantly didn't learn anything from my video game modding days, which led to this taking longer than it should have. On the bright side, almost all of the test cases compile down to be a single print statement! On the less bright side, ShuLang still doesn't have functions!!!!

### Sparse Conditional Constant Propagation
Most programmers intuitively understand normal constant propagation. For example in this ShuLang program:
```
bind x to 5
bind y to x + 1
print(y)
```

We see that both `x` and `y`'s are constants, and a constant analysis pass might output something like:

```
bind x to 5 {x = 5}
bind y to x + 1 {y = 6, x = 5}
print(y) {y = 6, x = 5}
```

Where we save one constant mapping for each instructions. This works, however in SSA form everything gets assigned to one time, so this is very wasteful. However, things get a little funky at join points:

```
entry:
    x0 = true
    jump to bb0 if x0 else jump to bb1

bb0:
    x1 = 1
    jump bb2

bb1:
    x2 = 2
    jump bb2

bb2:
    y = phi [ bb0: x1 ] [ bb1: x2 ]
    print(y)
    exit
```

In traditional constant propagation, `y` would be overdefined (or as mathematicians call it TOP) as depending on the predecesor block, `y` can either have the value `1`or `2`, and because we don't know which block will be the predecssor at compile time (yet), we can't infer `y`'s value. However, it's obvious that at runtime we will go from entry, to bb1, to bb2, hence two ideas spring fourth when we're in SSA.
1. Maintain a global mapping of values to constants
2. Consider live edges. E.g. if an argument to an conditional jump is known at compile time, then we can keep track of what edge will be taken.

This means that before our analysis would only output what variables are constants, however now we can also output a set of live edges. Using this information, when we reach bb2, we only consider reachable edges when figuring out the value of `y, and now we can infer its value to be `1`, and this pass would transform the program to be:

```
entry: 
    x0 = true
    jump to bb0 if true else jump to bb1 // Propagated!

bb0:
    x1 = 1
    jump to bb2

bb1:
    x2 = 2
    jump to bb2

bb2:
    y = 1 // Propagated!
    print(1) // Propagated!
    exit
```

### CFGSimplification
Now hold on, we have have a block that never gets jumped to, and also yet a condtional jump that can be made unconditionial? Enter the CFGSimplification pass, which will transform this program to be:

```
entry: 
    x0 = true
    jump to bb0

bb0:
    x1 = 1
    jump to bb2

bb2:
    y = 1 // Propagated!
    print(1)
    exit
```

### CFG Block Merging
Jump instructions have a potential to be expensive, so we try to avoid them as much as possible, and even eliminate them whenever possible. A key insight into how this elimination occurs is notcing  that Whenever a block has one predecessor, we can merge said block into its predecessor. This pass does exactly that, doing book keeping on phi nodes, and would change the previous program into:

```
entry: 
    x0 = true
    x1 = 1
    y = 1
    print(1)
    exit
```

### Dead Store Elimination
In the previous program we see a bunch of variables that don't have any uses, so why not get rid of them? This pass does exactly that!

```
entry: 
    print(1)
    exit
```


However, do note that stores in the form of `x = read_input()` will NOT be optimized out, as to not change the observable behavior of the program.

### Optimization pipelining
Something to note is that a lot of these optimizations rely on analysis like use define chains, constant values, and a control flow graph. However, some of the optimizations will also invalidate said analysis and require them to be rebuilt. Also, performing some optimizations might make redoing previous optmizations have new results, hence shuc does fixed point iteration by redoing ALL optmization passes everytime an optimization in the pipeline changes the program. While this is very inefficient anda LLVM style pass manager would be far better, this is still a great start.

### Benchmarking
I have a couple [benchmarks](benchmarks) setup already, but I probably should add more. In general what we see is:
- The compiler always does 2 iterations for optimizations
- Tokenization is comically SLOW
    - So I wrote a tokenizer that works (not one that's optimal), meaning that there's a lot of string operations going on which is slow!
- Optimizations sped up LLVM code generation by approximately the amount of time the optimizations itself took
    - This means that performing optimizations has a negligible compile time cost as the cost is paying for itself
- "shuc -O1" sped up clang's compile time as well
    - This is in part due to clang tokenize/parse the file separately, and with passes like CFG Merge and CFG Simplify shuc dramatically removes that cost
- Compile times for clang notably did not increase between "clang -O1" and "clang -O2"


All of this to say shuc generates really good quality LLVM IR, as compile times and run times are fast.

### What's next?
For adding even more optimizations the logical next step is to add [loop invariant code motion](https://en.wikipedia.org/wiki/Loop-invariant_code_motion) and [loop unrolling](https://en.wikipedia.org/wiki/Loop_unrolling). Another direction to take the optimizer is getting closer to LLVM's passmanager, where I only rerun optimizations on what changed instead of the entire program. 

Right now all ShuLang has are simple arithmetic operatations, if statements, and loops. So let's add lambda's to make this language interesting!


## INTERMISSION: Waiting to be free from university...
Okay so basically university is starting and I gotta lock in (and also apply for jobs); meaning that I will not be focusing on ShuLang. Hence updates will slow down. What's next will be constant folding, constant propagation, dead code elmination, and compiling user input. 

I noticed that I wasn't testing the actual driver file itself, so I've changed the tester to do that when the `--regression` flag is passed. For regression tests all previous programs are run, and the tester will do a diff to make sure that nothing changed when it shouldn't.

I also found a bug corresponding with pseudo phi promotion that made loops not compile (kid named dataflow analysis), so I fixed that! 

I also was about to start doing liveness analysis then found out I didn't need to, so that was fun! Also my algorithm for pseudo phi promotion [seems to be optimal](https://c9x.me/compile/bib/braun13cc.pdf)? I just need to do dead store elimination.

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
