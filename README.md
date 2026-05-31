# ShuLang
This langauge is in part being made to garner skills that I currently don't have (e.g. LLVM and C++), and in part for fun. I intend for this langauge to be as close to English as possible, while also taking heavy inspiration from the STLC. The "as close to english" should be appearant when you see variable like:

```
bind x to 5
```

Programmers are all to familiar with the common `x = 5` syntax, and instead of reinventing the wheel I intend to shatter and create it from the ground up. You'll also notice that there are s-expressions, which will probably be a pain to compile, however they are here because I am functional programming pilled.

I intend for this compiler to have at the minimum 5 Acts, which will be loosely based on the [book we used in the IU compiler class](https://github.com/IUCompilerCourse/Essentials-of-Compilation). Between each Act I'll maybe have an intermission where I'll either do something cool or talk about how I need to refactor things. Of course the compiler is in C++ and not Python/Racket which will provide many differences, and a lot of the features aren't translatable one to one into ShuLang, but I still think this approach will be better than doing everything at once.

This language is using a recursive descent parser and tokenization is pretty much just a linear scan of a file.

If you want to mess around with writing some ShuLang programs then clone the repository and run `make build` in `/src`. After that, you'll be given a `shuc` executable that you can use to compile programs!

If you want a timeline of what I've done and what's next, one can be find in [timeline.md](timeline.md). Here's what I'm currently working on:

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

## Optimization pipelining
Something to note is that a lot of these optimizations rely on analysis like use define chains, constant values, and a control flow graph. However, some of the optimizations will also invalidate said analysis and require them to be rebuilt. Also, performing some optimizations might make redoing previous optmizations have new results, hence shuc does fixed point iteration by redoing ALL optmization passes everytime an optimization in the pipeline changes the program. While this is very inefficient anda LLVM style pass manager would be far better, this is still a great start.

## What's next?
For adding even more optimizations the logical next step is to add [loop invariant code motion](https://en.wikipedia.org/wiki/Loop-invariant_code_motion) and [loop unrolling](https://en.wikipedia.org/wiki/Loop_unrolling). Another direction to take the optimizer is getting closerto LLVM's passmanager, where I only rerun optimizations on what changed instead of the entire program. A more pressing issue however would be to start profiling the compiler, which is what I plan to do and have started doing. Surprisingly enough, the tokenizer is what takes the most amount of time in the compiler, however this makes sense when one considers that the tokenizer is the greatest source of file I/O. 
