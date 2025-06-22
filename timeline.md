# General timeline

This is subject to change.

## Act 2: Conditionals
Here I'll introduce the `if` and `true` and `false` stuff, as well as the funny boolean operators (e.g. `and`).

## Act 3: Loops
The `while` and `for` stuff :D.

## Act 4: Functions
You know what a function is, I know what a function is, it's time to have some fun compiling them.

## Act 5: Objects
Me when I need a VTable.

## Completed Acts

###  Act 1: Arithmetic, Integers, and Variables
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