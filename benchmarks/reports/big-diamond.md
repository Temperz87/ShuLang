# Report for programs/big-diamond.sl
Times determined by running each part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 108438.2μs | 82306.3μs | 86471.6μs |
| shuc -O1 | 483286.8μs | 485824.5μs | 484130.8μs |

shuc -O0 pass timings
- Tokenization: 4369.8μs
- Parsing: 1032.1μs
- Type Checking: 791.6μs
- Short Circuitify: 139.3μs
- Remove Complex Operands: 226.5μs
- SIR Instruction Selection: 2903.9μs
- Promote Phi: 2643.6μs
- LLVM Codegen: 4407.0μs
- Total compilation time: 19854.5μs

shuc -O1 pass timings
- Tokenization: 4285.3μs
- Parsing: 1026.5μs
- Type Checking: 779.2μs
- Short Circuitify: 136.5μs
- Remove Complex Operands: 220.8μs
- SIR Instruction Selection: 2810.6μs
- Promote Phi: 2532.3μs
- Optimizations: 390049.7μs
- Optimization iterations: 2
- LLVM Codegen: 268.5μs
- Total compilation time: 402362.8μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2681.8μs | 2662.0μs | 2786.4μs |
| shuc -O1 | 2730.4μs | 2635.9μs | 2669.0μs |
