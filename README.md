# ShuLang
This langauge is in part being made to garner skills that I currently don't have (e.g. LLVM and C++), and in part for fun. I intend for this langauge to be as close to English as possible, while also taking heavy inspiration from the STLC. The "as close to english" should be appearant when you see variable like:

```
bind x to 5
```

Programmers are all to familiar with the common `x = 5` syntax, and instead of reinventing the wheel I intend to shatter and create it from the ground up. You'll also notice that there are s-expressions, which will probably be a pain to compile, however they are here because I am functional programming pilled.

I intend for this compiler to have at the minimum 5 Acts, which will be loosely based on the [book we used in the IU compiler class](https://github.com/IUCompilerCourse/Essentials-of-Compilation). Between each Act I'll maybe have an intermission where I'll either do something cool or talk about how I need to refactor things. Of course the compiler is in C++ and not Python/Racket which will provide many differences, and a lot of the features aren't translatable one to one into ShuLang, but I still think this approach will be better than doing everything at once.

This language is using a recursive descent parser and tokenization is pretty much just a linear scan of a file.

If you want a timeline of whats going on, one can be find in [timeline.md](timeline.md). Here's what I'm currently working on.

## Act 2: Conditionals
Here I'll introduce the `if` and `true` and `false` stuff, as well as the funny boolean operators (e.g. `and`).

### Parser changes
Now we have a construct that has a body, meaning I need a `parse_body` function. This functions check if there's a `{`, and if so parses a sequence of statement, other wise parses a single statement.

I also changed how operators get parsed in order to make it more extensible. Basically as I was going up in precedence I hard coded a massive `if (op == "op" ||...)` and manually passed through the next function. Now I have everything in an array and it's super easy to add new operators.

I also have to write another precedence function!!!
- I defered this to later because I really don't want to...

### Type checking
Everything in ShuLang before was an Integer, but in order to implement conditionals we need to implement a type checker. I'll just do the standard bidirectional "do I synthesize or check a type :O"

### Uniquification
I changed how variables get uniquified in this pass. Basically instead of reuniquifying already uniquified variables in order to get unique variabels, I just use the already uniquified name.

### New pass: Short Circuit-ification
In the Racket programming langauge, the expression `(and lhs rhs)` if just a macro for `(if lhs rhs #f)` And similarly `(or lhs rhs)` becomes `(if lhs #t rhs)`. This is useful because it allows for short circuiting, where we only evaluate the right hand side when we need to. The side effect of this change is we're introducing a new jump instruction, and as we know jump instructions are slow. 

If the `rhs` is an atomic value (variable reference, true, or false) then short circuiting because useless, as the `rhs` is already evalutated as ShuLang is call-by value. Hence instead of inserting a new block, we'll leave it as is and use the SIR `cmp` instructions.

This pass is strictly an optimization pass so I'll be saving it until after I had if's compiled. Trying to implement this pass early on demonstrated serious flaws with my visitor class, and how I'll need to reimplement it.

### Remove complex operands
We have to make sure that the condition of the if is not complex.

### Select SIR instructions
The first pass that's different in a meaningful way. 

When I encounter an if statement I must create a block for the condition portion of the if statement, the "then" portion, another for an "else" portion if it exists, and also a block for the continuation if it exists. The newly created blocks should then jump to the continuation or an "exit" block, which means I have to create an exit block

I also translate `true` to `1` and `false` to `0`. The type checker assures that this is okay.

One other thing I took the liberty of doing is making SIR actually SSA, which means that I had to insert phi nodes (see [here](https://en.wikipedia.org/wiki/Static_single-assignment_form) for more information) in a bunch of places. However, we can't know what predecesor blocks could contain the variable we're looking for yet, so instead we insert a "pseudo phi node" and make it a real phi node (or instead just make it a reference) in the next pass.

### Promote Pseudo Phi
This pass required me to create a [CFG](https://en.wikipedia.org/wiki/Control-flow_graph) (CFG is slang for control flow graph btw), so I did that. 

The this pass works is:
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

I found out that I can disable constant folding, so instead of creating alloca's I juset reference a dictionary I create. Hence me having to use the CFG again! This time the pass go forwards in a BFS fashion, and only visits blocks if their predecessors have been visited. Maybe there's a more memory effecient way to do this, but I'll worry about that later.
