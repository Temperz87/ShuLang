# Report for programs/arithmetic-heavy.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 40488.6μs | 41758.6μs | 41000.0μs |
| shuc -O1 | 39559.0μs | 50615.8μs | 47935.7μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 40175.2μs | 41445.3μs | 40686.6μs |
| shuc -O1 | 39202.6μs | 50259.5μs | 47579.3μs |

shuc -O0 pass timings
- Tokenization: 19.5μs
- Parsing: 8.5μs
- Type Checking: 12.8μs
- Short Circuitify: 5.8μs
- Remove Complex Operands: 3.0μs
- SIR Instruction Selection: 14.9μs
- Promote Phi: 11.2μs
- LLVM Codegen: 84.8μs
- Total compilation time: 313.4μs

shuc -O1 pass timings
- Tokenization: 19.1μs
- Parsing: 9.1μs
- Type Checking: 13.0μs
- Short Circuitify: 6.0μs
- Remove Complex Operands: 3.1μs
- SIR Instruction Selection: 15.0μs
- Promote Phi: 12.3μs
- Optimization iterations for main: 2
- Optimizations: 40.0μs
- LLVM Codegen: 83.3μs
- Total compilation time: 356.4μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 97121.5μs | 2375.3μs | 2393.9μs |
| shuc -O1 | 98303.3μs | 2300.7μs | 2294.3μs |
