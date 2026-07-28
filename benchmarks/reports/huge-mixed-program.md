# Report for programs/huge-mixed-program.sl
Times determined by running each part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 56171.1μs | 60055.3μs | 65072.5μs |
| shuc -O1 | 59194.6μs | 59941.0μs | 63757.5μs |

shuc -O0 pass timings
- Tokenization: 189.4μs
- Parsing: 48.6μs
- Type Checking: 54.7μs
- Short Circuitify: 17.0μs
- Remove Complex Operands: 15.5μs
- SIR Instruction Selection: 92.7μs
- Promote Phi: 84.1μs
- LLVM Codegen: 287.3μs
- Total compilation time: 1123.7μs

shuc -O1 pass timings
- Tokenization: 142.1μs
- Parsing: 35.0μs
- Type Checking: 42.3μs
- Short Circuitify: 12.3μs
- Remove Complex Operands: 10.8μs
- SIR Instruction Selection: 70.9μs
- Promote Phi: 62.3μs
- Optimizations: 1509.0μs
- Optimization iterations: 2
- LLVM Codegen: 183.1μs
- Total compilation time: 2323.7μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2789.2μs | 2681.0μs | 2653.2μs |
| shuc -O1 | 2618.6μs | 2595.1μs | 2739.5μs |
