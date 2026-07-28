# Report for programs/arithmetic-heavy.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 38963.5μs | 40326.2μs | 40361.9μs |
| shuc -O1 | 38975.7μs | 40308.2μs | 40478.7μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 38676.3μs | 40039.0μs | 40074.7μs |
| shuc -O1 | 38643.6μs | 39976.1μs | 40146.6μs |

shuc -O0 pass timings
- Tokenization: 17.4μs
- Parsing: 7.9μs
- Type Checking: 12.9μs
- Short Circuitify: 5.3μs
- Remove Complex Operands: 2.8μs
- SIR Instruction Selection: 10.2μs
- Promote Phi: 8.4μs
- LLVM Codegen: 78.9μs
- Total compilation time: 287.2μs

shuc -O1 pass timings
- Tokenization: 17.0μs
- Parsing: 7.6μs
- Type Checking: 11.9μs
- Short Circuitify: 5.3μs
- Remove Complex Operands: 2.8μs
- SIR Instruction Selection: 10.1μs
- Promote Phi: 8.2μs
- Optimizations: 52.4μs
- Optimization iterations: 2
- LLVM Codegen: 75.8μs
- Total compilation time: 332.1μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 96366.7μs | 2511.7μs | 2633.4μs |
| shuc -O1 | 96361.5μs | 2569.3μs | 2486.8μs |
