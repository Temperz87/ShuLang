# Report for programs/arithmetic-heavy.sl
Times determined by running each part 10000 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 53738.4μs | 55897.2μs | 56014.3μs |
| shuc -O1 | 54219.9μs | 56127.6μs | 56228.6μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 53338.7μs | 55497.5μs | 55614.7μs |
| shuc -O1 | 53751.3μs | 55659.1μs | 55760.0μs |

shuc -O0 pass timings
- Tokenization: 21.0μs
- Parsing: 9.1μs
- Type Checking: 13.5μs
- Short Circuitify: 5.3μs
- Remove Complex Operands: 1.6μs
- SIR Instruction Selection: 15.1μs
- Promote Phi: 15.4μs
- LLVM Codegen: 142.3μs
- Total compilation time: 399.7μs

shuc -O1 pass timings
- Tokenization: 21.0μs
- Parsing: 9.2μs
- Type Checking: 13.6μs
- Short Circuitify: 5.3μs
- Remove Complex Operands: 1.6μs
- SIR Instruction Selection: 15.1μs
- Promote Phi: 15.4μs
- Optimizations: 70.1μs
- Optimization iterations: 2
- LLVM Codegen: 141.2μs
- Total compilation time: 468.6μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 266870.7μs | 1226.8μs | 1229.8μs |
| shuc -O1 | 266893.9μs | 1228.4μs | 1231.1μs |
