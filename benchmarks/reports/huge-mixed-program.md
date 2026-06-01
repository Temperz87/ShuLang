# Report for programs/huge-mixed-program.sl
Times determined by running each measure part 100 times then taking the average

Note that individual pass timings are NOT averaged out
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 60672.5μs | 64797.7μs | 65271.8μs |
| shuc -O1 | 57949.5μs | 58708.4μs | 58661.9μs |

shuc -O0 pass timings
- Tokenization: 499 micro seconds
- Parsing: 68 micro seconds
- Type Checking: 43 micro seconds
- Short Circuitify: 12 micro seconds
- Remove Complex Operands: 13 micro seconds
- SIR Instruction Selection: 46 micro seconds
- Promote Phi: 56 micro seconds
- LLVM Codegen: 459 micro seconds
- Total compilation time: 1212 microseconds

shuc -O1 pass timings
- Tokenization: 738 micro seconds
- Parsing: 62 micro seconds
- Type Checking: 41 micro seconds
- Short Circuitify: 10 micro seconds
- Remove Complex Operands: 9 micro seconds
- SIR Instruction Selection: 42 micro seconds
- Promote Phi: 53 micro seconds
- Optimizations: 1233 micro seconds
- Optimization iterations: 2
- LLVM Codegen: 652 micro seconds
- Total compilation time: 2860 microseconds

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2621.6μs | 2579.3μs | 2516.3μs |
| shuc -O1 | 2566.8μs | 2501.4μs | 2533.5μs |
