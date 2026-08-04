# Report for programs/arithmetic-heavy.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 37302.6μs | 39399.2μs | 39206.1μs |
| shuc -O1 | 37628.6μs | 39542.5μs | 39396.3μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 36992.3μs | 39089.0μs | 38895.9μs |
| shuc -O1 | 37289.7μs | 39203.6μs | 39057.4μs |

shuc -O0 pass timings
- Tokenization: 18.8μs
- Parsing: 8.6μs
- Type Checking: 12.7μs
- Short Circuitify: 5.2μs
- Remove Complex Operands: 2.7μs
- SIR Instruction Selection: 13.6μs
- Promote Phi: 12.2μs
- LLVM Codegen: 86.1μs
- Total compilation time: 310.2μs

shuc -O1 pass timings
- Tokenization: 18.0μs
- Parsing: 8.0μs
- Type Checking: 12.1μs
- Short Circuitify: 5.3μs
- Remove Complex Operands: 3.0μs
- SIR Instruction Selection: 13.9μs
- Promote Phi: 11.1μs
- Optimization iterations for main: 1
- Optimizations: 35.5μs
- LLVM Codegen: 82.1μs
- Total compilation time: 338.9μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 93285.3μs | 2054.3μs | 1772.4μs |
| shuc -O1 | 92967.1μs | 1826.9μs | 1822.3μs |
