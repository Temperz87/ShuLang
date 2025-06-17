# ShuLang
This langauge is in part being made to garner skills that I currently don't have (e.g. LLVM and C++), and in part for fun. I intend for this langauge to be as close to English as possible, while also taking heavy inspiration from the STLC. The "as close to english" should be appearant when you see variable like:

```
bind x to 5
```

Programmers are all to familiar with the common `x = 5` syntax, and instead of reinventing the wheel I intend to shatter and create it from the ground up. You'll also notice that there are s-expressions, which will probably be a pain to compile, however they are here because I am functional programming pilled.

I intend for this compiler to have at the minimum 5 phases, which will be loosely based on the [book we used in the IU compiler class](https://github.com/IUCompilerCourse/Essentials-of-Compilation). Between each phase I'll maybe have an intermission which can be thought of as a "mini phase" where I'll either do something cool or talk about how I need to refactor things. Of course the compiler is in C++ and not Python/Racket which will provide many differences, and a lot of the features aren't translatable one to one into ShuLang, but I still think this approach will be better than doing everything at once.

This language is using a recursive descent parser and tokenization is pretty much just a linear scan of a file.

## INTERMISSION: General cleanup and making pointers smart
I used zero smart pointers so now I have to go back and decide on how ownership should work. I also want to create some .cpp files for my .hpp stuff, and get rid of todo's. There's also some errors when I compile which can't be good, so those need to be gotten rid of.

I also want to implement multiplication and subtraction. This shouldn't be that bad but it seems really tedious as I'll need the corrsponding SIR nodes and what not.

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

## Completed Phases


###  Phase 1: Arithmetic, Integers, and Variables
Simple arithmetic is now functioning, meaning we have variable bindings as well as addition and printing.

Here are the passes used:
1. Uniquify Variable Names
    - In Uniquify Variable Names, all variables will be assigned an unique name (shocker :O)

2. Remove Complex Operands
- There's this idea of [three address code](https://en.wikipedia.org/wiki/Three-address_code), [A-normal form](https://en.wikipedia.org/wiki/A-normal_form) (somethimes jokingly called Amr normal form after its creator), and [Continuation Passing Style](https://en.wikipedia.org/wiki/Continuation-passing_style) as an IR. Before we go to an IR however, we'll want to make sure that no operator has operands with operators.

3.  SIR Instruction Selection
- In this pass we lower to SSA. No optimizations are done currently, however constant folding is planned for when I get to loops.
4. LLVM Instruction Selection
    - SIR gets lowered to LLVM. We also declare `printf` and insert `"%d\n` format specifier in this pass.