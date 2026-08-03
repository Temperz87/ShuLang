# Report for programs/arithmetic-heavy.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 39577.6μs | 41312.1μs | 40730.2μs |
| shuc -O1 | 39469.6μs | 39802.1μs | 40642.3μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 39260.9μs | 40995.3μs | 40413.5μs |
| shuc -O1 | 39109.7μs | 39442.2μs | 40282.4μs |

shuc -O0 pass timings
- Tokenization: 18.8μs
- Parsing: 8.4μs
- Type Checking: 12.0μs
- Short Circuitify: 5.9μs
- Remove Complex Operands: 2.5μs
- SIR Instruction Selection: 14.2μs
- Promote Phi: 12.0μs
- LLVM Codegen: 85.0μs
- Total compilation time: 316.8μs

shuc -O1 pass timings
- Tokenization: 18.5μs
- Parsing: 9.1μs
- Type Checking: 12.9μs
- Short Circuitify: 5.8μs
- Remove Complex Operands: 2.9μs
- SIR Instruction Selection: 14.7μs
- Promote Phi: 12.2μs
- Optimization iterations for main: 1
- Optimizations: 35.8μs
- LLVM Codegen: 84.2μs
- Total compilation time: 359.9μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 97465.1μs | 2249.3μs | 2250.4μs |
| shuc -O1 | 97300.2μs | 2315.1μs | 2249.9μs |
