# Report for programs/arithmetic-heavy.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 59861.6μs | 59576.2μs | 60365.0μs |
| shuc -O1 | 51930.6μs | 55384.5μs | 54746.2μs |

shuc -O0 pass timings
- Tokenization: 61.0μs
- Parsing: 25.2μs
- Type Checking: 34.8μs
- Short Circuitify: 11.2μs
- Remove Complex Operands: 5.4μs
- SIR Instruction Selection: 30.0μs
- Promote Phi: 18.5μs
- LLVM Codegen: 437.4μs
- Total compilation time: 672.7μs

shuc -O1 pass timings
- Tokenization: 38.0μs
- Parsing: 15.8μs
- Type Checking: 22.5μs
- Short Circuitify: 7.1μs
- Remove Complex Operands: 3.3μs
- SIR Instruction Selection: 19.3μs
- Promote Phi: 12.1μs
- Optimizations for main: 59.4μs
- Optimization iterations for main: 2
- LLVM Codegen: 305.4μs
- Total compilation time: 520.7μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 97149.6μs | 2233.8μs | 2088.3μs |
| shuc -O1 | 97236.8μs | 2305.9μs | 2396.3μs |
