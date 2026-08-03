# Report for programs/huge-mixed-program.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 43790.1μs | 49142.2μs | 48279.2μs |
| shuc -O1 | 46676.4μs | 46485.2μs | 46318.8μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 42379.0μs | 47731.0μs | 46868.1μs |
| shuc -O1 | 45369.7μs | 45178.5μs | 45012.2μs |

shuc -O0 pass timings
- Tokenization: 220.3μs
- Parsing: 54.7μs
- Type Checking: 67.5μs
- Short Circuitify: 21.4μs
- Remove Complex Operands: 17.5μs
- SIR Instruction Selection: 128.0μs
- Promote Phi: 105.8μs
- LLVM Codegen: 377.9μs
- Total compilation time: 1411.1μs

shuc -O1 pass timings
- Tokenization: 136.5μs
- Parsing: 36.8μs
- Type Checking: 42.5μs
- Short Circuitify: 12.6μs
- Remove Complex Operands: 11.9μs
- SIR Instruction Selection: 80.7μs
- Promote Phi: 67.4μs
- Optimization iterations for main: 2
- Optimizations: 485.4μs
- LLVM Codegen: 179.5μs
- Total compilation time: 1306.7μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2299.3μs | 2288.3μs | 2352.3μs |
| shuc -O1 | 2407.4μs | 2354.4μs | 2420.7μs |
