# Report for programs/imperative-fibonacci.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 36575.2μs | 39283.8μs | 39935.7μs |
| shuc -O1 | 37640.5μs | 39608.4μs | 40552.2μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 36253.3μs | 38961.9μs | 39613.8μs |
| shuc -O1 | 37272.5μs | 39240.5μs | 40184.2μs |

shuc -O0 pass timings
- Tokenization: 20.8μs
- Parsing: 8.5μs
- Type Checking: 13.9μs
- Short Circuitify: 6.0μs
- Remove Complex Operands: 2.6μs
- SIR Instruction Selection: 17.2μs
- Promote Phi: 12.6μs
- LLVM Codegen: 87.1μs
- Total compilation time: 321.9μs

shuc -O1 pass timings
- Tokenization: 21.6μs
- Parsing: 8.7μs
- Type Checking: 13.4μs
- Short Circuitify: 6.1μs
- Remove Complex Operands: 2.9μs
- SIR Instruction Selection: 18.0μs
- Promote Phi: 12.9μs
- Optimization iterations for main: 1
- Optimizations: 42.5μs
- LLVM Codegen: 88.2μs
- Total compilation time: 368.0μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 1936.9μs | 1841.6μs | 1856.0μs |
| shuc -O1 | 1858.0μs | 1773.8μs | 1772.6μs |
