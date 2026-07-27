# Report for programs/huge-mixed-program.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 57649.1μs | 66811.3μs | 63641.9μs |
| shuc -O1 | 57027.5μs | 58489.4μs | 59191.7μs |

shuc -O0 pass timings
- Tokenization: 263.8μs
- Parsing: 53.0μs
- Type Checking: 59.7μs
- Short Circuitify: 19.0μs
- Remove Complex Operands: 15.4μs
- SIR Instruction Selection: 100.0μs
- Promote Phi: 85.5μs
- LLVM Codegen: 324.9μs
- Total compilation time: 1282.2μs

shuc -O1 pass timings
- Tokenization: 135.5μs
- Parsing: 34.7μs
- Type Checking: 40.5μs
- Short Circuitify: 12.1μs
- Remove Complex Operands: 10.5μs
- SIR Instruction Selection: 65.8μs
- Promote Phi: 55.7μs
- Optimizations: 1328.1μs
- Optimization iterations: 2
- LLVM Codegen: 182.2μs
- Total compilation time: 2103.5μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2856.3μs | 2667.4μs | 2761.8μs |
| shuc -O1 | 2592.1μs | 2389.5μs | 2261.2μs |
