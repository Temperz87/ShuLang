# Report for programs/huge-mixed-program.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 82100.9μs | 81663.1μs | 82601.4μs |
| shuc -O1 | 83725.5μs | 83020.0μs | 83559.3μs |

shuc -O0 pass timings
- Tokenization: 145.9μs
- Parsing: 36.4μs
- Type Checking: 43.6μs
- Short Circuitify: 12.7μs
- Remove Complex Operands: 11.6μs
- SIR Instruction Selection: 68.2μs
- Promote Phi: 59.7μs
- LLVM Codegen: 219.9μs
- Total compilation time: 781.3μs

shuc -O1 pass timings
- Tokenization: 139.9μs
- Parsing: 35.8μs
- Type Checking: 42.7μs
- Short Circuitify: 12.5μs
- Remove Complex Operands: 11.2μs
- SIR Instruction Selection: 66.5μs
- Promote Phi: 58.0μs
- Optimizations: 1345.6μs
- Optimization iterations: 2
- LLVM Codegen: 181.2μs
- Total compilation time: 2067.1μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2380.8μs | 2649.1μs | 2274.1μs |
| shuc -O1 | 2345.8μs | 2598.7μs | 2609.2μs |
