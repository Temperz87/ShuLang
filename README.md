# ShuLang

- [About](#about)
  - [Language Features](#language-features)
- [Getting Started](#getting-started)
  - [Running and Building ShuC](#running-and-building-shuc)
  - [ShuC Usage](#shuc-usage)
  - [Example Programs](#example-programs)
- [Compiler Architecture](#compiler-architecture)
  - [Front End](#front-end)
  - [Middle End](#middle-end)
  - [Middle End Optimizations](#middle-end-optimizations)
  - [Optimization Benchmarks](#optimization-benchmarks)
- [License](#license)

## About
The ShuLang project is a compiler research project focused on modern compiler construction techniques, and is still ongoing. The language itself is statically typed and imperative, and has syntax similar to Rust, despite me not knowing Rust when I created my language. If you want to see more of what I've done and what's next, it can be found in [timeline.md](timeline.md). If you would like summary:

### Language Features
Implemented
- Integer arithmetic
- Comparisons
- Conditional Branching
- While loops
- Function calls
- Recursion
- Printing to standard output
- Reading an integer from standard input

Planned
- Objects utilizing [ARC](https://en.wikipedia.org/wiki/Automatic_Reference_Counting)
- First class functions and lambdas
- Interoperability with other languages

## Getting Started
### Running and Building ShuC
To use the ShuLang compiler (ShuC), you will need [clang](https://clang.llvm.org/get_started.html) to be installed, as ShuC uses clang to output an executable from LLVM IR. 

To build ShuC, [LLVM](https://apt.llvm.org/) version 22 needs to be installed with the `dev` module. Once LLVM is installed, run `make shuc` in the [src](src) directory to build ShuC. The compiler will be present at "/src/output/shuc". 

If you would like to run the tester, you will also need to install [pybind11](https://pybind11.readthedocs.io/en/stable/installing.html) in order to generate Python bindings. Building the bindings can then be done by running `make python-bindings`. and the tester can now be ran under the [test-cases](test-cases) directory.


### ShuC Usage
ShuC is currently only capable of compiling one file at a time. Compiling a file is as simple as passing it in as a command line argument. ShuC also features other CLI arguments:
- `--help`: Displays helpful information
- `-l`: Outputs LLVM IR instead of an executable
- `-o <path>`: Outputs the compiled file the provided path
- `-O<n>`: Enables optimizations up to level `n`. Currently, the maximum optimization level is `1`
- `--timings`: Displays how long each pass took to finish

### Example Programs
Example programs can be found both in the [fun-programs](fun-programs) directory and in the [test-cases] directory. A documentation for the grammar of ShuLang can be found in [ShuLang-grammar.md](ShuLang-grammar.md).

Here's an example imperative program to calculate factorial of 5 in ShuLang:

```
bind acc to 1
bind n to 5
while n != 1 {
    bind acc to acc * n
    bind n to n - 1
}

print(acc)
```

And here's a recursive way of doing it:

```
bind factorial(n : Integer) -> Integer in {
    bind factorialAcc(n : Integer, acc : Integer) -> Integer in {
        if n = 0
            return acc
        else 
            return factorialAcc(n - 1, acc * n)
    }

    return factorialAcc(n, 1)
}

print(factorial(5))
```

## Compiler Architecture
ShuC can be separated into three phases, particularly:
1. Front end
    - Creating an AST and lowering to ShuLang intermediate representation (SIR)
2. Middle end
    - Optimizing SIR
3. LLVM code generation
    - Creating the final LLVM IR and creating the final executable

### Front End
ShuC's front end is relatively simple, with a couple a passes:
1. Tokenization/Parsing
2. Short Circuitify
    - Making it easier on the IR to enforce and/or lazy evaluation by transforming them into conditional branches when applicable
3. Remove Complex Operands
    - Converting an AST into code akin to [three address notation](https://en.wikipedia.org/wiki/Three-address_code)
4. SIR instruction selection

### Middle End
ShuC's middle end operates entirely on the ShuLang Intermediate Representation [SIR](SIR-grammar.md). SIR is SSA-based, however makes a distinction between values and definitions, meaning values still have to be bound to definitions. There are two middle end passes, ignoring optimizations, those being:
1. Promote Pseudo Phi
2. LLVM instruction selection
    - Converts SIR into LLVM

During SIR instruction selection, when a given block doesn't contain a definition for a particular variable, a "pseudo phi" node gets placed in that same block requesting a value from a previous block, then Promote Pseudo Phi will reify them into phi nodes. If you would like to learn more about how the algorithm works, I suggest looking at the [pass source code itself](src/passes/PromotePseudoPhi.cpp). 

### Middle End Optimizations
ShuC also runs middle end optimizations on the code, featuring:
- IPSCCP
- Constant Folding 
- CFG Simplification
- CFG Merging
- Dead Store Elimination 

### Optimization benchmarks
These optimizations have been benchmarked, and the complete results can be found in the [benchmarks](benchmarks) directory. 


## License
Distributed under the MIT License. [See LICENSE](LICENSE) for more information.
