# Report for programs/huge-mixed-program.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 58776.9μs | 63392.7μs | 62309.6μs |
| shuc -O1 | 53387.6μs | 57899.0μs | 58496.7μs |

shuc -O0 pass timings
- Tokenization: 940.0μs
- Parsing: 128.4μs
- Type Checking: 76.6μs
- Short Circuitify: 20.4μs
- Remove Complex Operands: 17.3μs
- SIR Instruction Selection: 84.5μs
- Promote Phi: 97.0μs
- LLVM Codegen: 696.7μs
- Total compilation time: 2086.5μs

shuc -O1 pass timings
- Tokenization: 522.2μs
- Parsing: 73.5μs
- Type Checking: 43.4μs
- Short Circuitify: 12.6μs
- Remove Complex Operands: 9.6μs
- SIR Instruction Selection: 47.4μs
- Promote Phi: 54.6μs
- Optimizations: 1165.8μs
- Optimization iterations: 2
- LLVM Codegen: 411.9μs
- Total compilation time: 2360.6μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2721.3μs | 2720.9μs | 2615.3μs |
| shuc -O1 | 2706.0μs | 2602.5μs | 2603.6μs |
