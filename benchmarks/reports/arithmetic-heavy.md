# Report for programs/arithmetic-heavy.sl
Times determined by running each measure part 100 times then taking the average

Note that individual pass timings are NOT averaged out
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 59553.1μs | 60167.1μs | 59834.6μs |
| shuc -O1 | 53818.1μs | 55274.2μs | 55656.1μs |

shuc -O0 pass timings
- Tokenization: 117 micro seconds
- Parsing: 45 micro seconds
- Type Checking: 55 micro seconds
- Short Circuitify: 16 micro seconds
- Remove Complex Operands: 4 micro seconds
- SIR Instruction Selection: 34 micro seconds
- Promote Phi: 16 micro seconds
- LLVM Codegen: 401 micro seconds
- Total compilation time: 734 microseconds

shuc -O1 pass timings
- Tokenization: 44 micro seconds
- Parsing: 11 micro seconds
- Type Checking: 12 micro seconds
- Short Circuitify: 3 micro seconds
- Remove Complex Operands: 0 micro seconds
- SIR Instruction Selection: 8 micro seconds
- Promote Phi: 6 micro seconds
- Optimizations: 46 micro seconds
- Optimization iterations: 2
- LLVM Codegen: 181 micro seconds
- Total compilation time: 327 microseconds

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 95770.0μs | 2468.5μs | 2491.4μs |
| shuc -O1 | 96026.3μs | 2490.3μs | 2457.8μs |
