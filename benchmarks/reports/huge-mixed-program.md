# Report for programs/huge-mixed-program.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 42605.5μs | 45522.8μs | 45641.8μs |
| shuc -O1 | 42537.5μs | 46601.3μs | 47057.7μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 41403.3μs | 44320.7μs | 44439.6μs |
| shuc -O1 | 40260.8μs | 44324.6μs | 44781.0μs |

shuc -O0 pass timings
- Tokenization: 206.0μs
- Parsing: 51.8μs
- Type Checking: 59.8μs
- Short Circuitify: 17.6μs
- Remove Complex Operands: 15.4μs
- SIR Instruction Selection: 101.4μs
- Promote Phi: 91.2μs
- LLVM Codegen: 311.6μs
- Total compilation time: 1202.2μs

shuc -O1 pass timings
- Tokenization: 138.9μs
- Parsing: 36.0μs
- Type Checking: 42.2μs
- Short Circuitify: 12.3μs
- Remove Complex Operands: 10.6μs
- SIR Instruction Selection: 69.2μs
- Promote Phi: 63.0μs
- Optimizations: 1477.7μs
- Optimization iterations: 2
- LLVM Codegen: 185.6μs
- Total compilation time: 2276.7μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2837.3μs | 2889.0μs | 2816.9μs |
| shuc -O1 | 2774.9μs | 2884.5μs | 2738.3μs |
