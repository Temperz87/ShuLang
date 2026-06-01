# Report for programs/arithmetic-heavy.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 55163.8μs | 56698.3μs | 56132.4μs |
| shuc -O1 | 49179.7μs | 50853.2μs | 50677.8μs |

shuc -O0 pass timings
- Tokenization: 85.0μs
- Parsing: 24.3μs
- Type Checking: 24.6μs
- Short Circuitify: 8.8μs
- Remove Complex Operands: 2.4μs
- SIR Instruction Selection: 18.1μs
- Promote Phi: 13.5μs
- LLVM Codegen: 386.2μs
- Total compilation time: 590.1μs

shuc -O1 pass timings
- Tokenization: 52.4μs
- Parsing: 16.2μs
- Type Checking: 15.7μs
- Short Circuitify: 5.8μs
- Remove Complex Operands: 1.6μs
- SIR Instruction Selection: 11.9μs
- Promote Phi: 8.9μs
- Optimizations: 54.0μs
- Optimization iterations: 2.0
- LLVM Codegen: 251.6μs
- Total compilation time: 437.5μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 95725.7μs | 2643.9μs | 2685.4μs |
| shuc -O1 | 95615.9μs | 2614.2μs | 2621.9μs |
