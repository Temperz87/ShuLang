# Report for programs/arithmetic-heavy.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 87498.9μs | 89093.0μs | 89113.9μs |
| shuc -O1 | 77122.5μs | 76002.6μs | 75998.1μs |

shuc -O0 pass timings
- Tokenization: 82.1μs
- Parsing: 9.9μs
- Type Checking: 17.1μs
- Short Circuitify: 7.2μs
- Remove Complex Operands: 3.5μs
- SIR Instruction Selection: 13.9μs
- Promote Phi: 11.1μs
- LLVM Codegen: 114.4μs
- Total compilation time: 390.1μs

shuc -O1 pass timings
- Tokenization: 16.4μs
- Parsing: 7.9μs
- Type Checking: 13.0μs
- Short Circuitify: 5.2μs
- Remove Complex Operands: 2.9μs
- SIR Instruction Selection: 11.3μs
- Promote Phi: 9.0μs
- Optimizations: 50.7μs
- Optimization iterations: 2
- LLVM Codegen: 87.0μs
- Total compilation time: 308.5μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2091.8μs | 2083.2μs | 2086.5μs |
| shuc -O1 | 2186.5μs | 2250.9μs | 2323.3μs |
