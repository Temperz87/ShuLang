# Report for programs/huge-mixed-program.sl
Times determined by running each part 10000 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 57973.3μs | 64252.8μs | 64838.9μs |
| shuc -O1 | 60923.9μs | 67375.1μs | 67639.2μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 56892.7μs | 63172.2μs | 63758.3μs |
| shuc -O1 | 56832.9μs | 63284.0μs | 63548.2μs |

shuc -O0 pass timings
- Tokenization: 179.1μs
- Parsing: 45.0μs
- Type Checking: 49.3μs
- Short Circuitify: 13.8μs
- Remove Complex Operands: 11.0μs
- SIR Instruction Selection: 88.9μs
- Promote Phi: 86.8μs
- LLVM Codegen: 330.4μs
- Total compilation time: 1080.6μs

shuc -O1 pass timings
- Tokenization: 178.7μs
- Parsing: 45.0μs
- Type Checking: 49.2μs
- Short Circuitify: 13.6μs
- Remove Complex Operands: 10.9μs
- SIR Instruction Selection: 88.7μs
- Promote Phi: 86.4μs
- Optimizations: 3073.9μs
- Optimization iterations: 2
- LLVM Codegen: 274.4μs
- Total compilation time: 4091.0μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 1507.4μs | 1496.2μs | 1491.6μs |
| shuc -O1 | 1494.6μs | 1494.3μs | 1501.0μs |
