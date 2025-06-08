# ShuLang
This langauge is in part being made to garner skills that I currently don't have (e.g. LLVM and C++), and in part for fun. I intend for this langauge to be as close to English as possible, while also taking heavy inspiration from the STLC. The "as close to english" should be appearant when you see variable like:

```
bind x to 5
```

Programmers are all to familiar with the common `x = 5` syntax, and instead of reinventing the wheel I intend to shatter and create it from the ground up. You'll also notice that there are s-expressions, which will probably be a pain to compile, however they are here because I am functional programming pilled.

I intend for this compiler to have at the minimum 5 phases, which will be loosely based on the [book we used in the IU compiler class](https://github.com/IUCompilerCourse/Essentials-of-Compilation). Of course the compiler is in C++ and not Python/Racket which will provide many differences, and a lot of the features aren't translatable one to one into ShuLang, but I still think this approach will be better than doing everything at once.

This language will be using a recursive descent parser, and will do a linear scan for tokenization.

## Phase 1: Arithmetic, Integers, and Variables
I first plan to get simple arithmetic and immutable variables compiling. This can be done in a couple passes. I also want some way of taking in user input so I can get meaningful programs that don't get entirely optimized out into "print the solution".

### Uniquify Variable Names
In Uniquify Variable Names, all variables will be assigned an unique name (shocker :O)

### Remove Complex Operands
There's this idea of [three address code](https://en.wikipedia.org/wiki/Three-address_code), [A-normal form](https://en.wikipedia.org/wiki/A-normal_form) (somethimes jokingly called Amr normal form after its creator), and [Continuation Passing Style](https://en.wikipedia.org/wiki/Continuation-passing_style) as an IR. Before we go to an IR however, we'll want to make sure that no operator has operands with operators.

### ShuIR Instruction Selection
In this pass, we'll be lowering to SSA. In this phase I don't think that I'll be doing any optimizations, but I may introduce [constant folding](https://en.wikipedia.org/wiki/Constant_folding) if I get it done quickly. 

### LLVM Instruction Selection
Here, we'll lower ShulinIR into LLVM. I have no idea how this'll work as of yet, but I hope that all will go smoothly.

## Phase 1.5: Variable liveness
I have this at 1.5 purely because I don't know if I have to do this or not given that LLVM has a register allocator. I get that every good compiler engineer should be able to do register allocation, but I don't know if it's a good idea for me to do it ontop of LLVM.

## Phase 2: Conditionals
Here I'll introduce the `if` and `true` and `false` stuff, as well as the funny boolean operators (e.g. `and`).

## Phase 3: Loops
The `while` and `for` stuff :D.

## Phase 4: Functions
You know what a function is, I know what a function is, it's time to have some fun compiling them.

## Phase 5: Objects
Me when I need a VTable.