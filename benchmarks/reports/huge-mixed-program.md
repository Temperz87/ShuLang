# Report for programs/huge-mixed-program.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 44795.3μs | 49254.7μs | 49557.1μs |
| shuc -O1 | 46364.7μs | 50220.2μs | 50572.8μs |

shuc -O0 pass timings
- Tokenization: 293.4μs
- Parsing: 33.9μs
- Type Checking: 36.8μs
- Short Circuitify: 9.8μs
- Remove Complex Operands: 8.6μs
- SIR Instruction Selection: 56.6μs
- Promote Phi: 45.9μs
- LLVM Codegen: 365.8μs
- Total compilation time: 865.1μs

shuc -O1 pass timings
- Tokenization: 312.5μs
- Parsing: 33.2μs
- Type Checking: 36.0μs
- Short Circuitify: 9.5μs
- Remove Complex Operands: 8.5μs
- SIR Instruction Selection: 54.9μs
- Promote Phi: 45.5μs
- Optimizations: 1085.0μs
- Optimization iterations: 2
- LLVM Codegen: 296.3μs
- Total compilation time: 1896.7μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2207.6μs | 2207.8μs | 2324.6μs |
| shuc -O1 | 2291.7μs | 2232.4μs | 2087.2μs |
