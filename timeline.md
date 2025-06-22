# General timeline

This is subject to change.

## Act 3: Loops
The `while` and `for` stuff :D.

## Act 4: Functions
You know what a function is, I know what a function is, it's time to have some fun compiling them.

## Act 5: Objects
Me when I need a VTable.

## Previous Acts

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

## INTERMISSION: General cleanup and making pointers smart
Here I separated some class definitions and declarations and used `shared_ptr`'s inside of ASTNodes instead of raw pointers. pybind11 doesn't play nice with unique pointers, hence me using shared ones instead; however if I ever decide to reorder instructions I'm sure it'll be easier to do with shared pointers instead of having to call move millions of times.

I also realized that the way I was parsing nodes was doing right to left associativity instead of left to right, hence I had to fix that. I also added the `*` and binary `-` operator (which means if you want to declare a negative number you need to do `0 - number` as there's no unary version).

This took a LONG time because I had to fix the parser and I spent a long time thinking about how associativity should work.
