# Report for programs/huge-mixed-program.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 46734.6μs | 53703.9μs | 49694.6μs |
| shuc -O1 | 41248.8μs | 45744.9μs | 46126.4μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 45631.8μs | 52601.2μs | 48591.9μs |
| shuc -O1 | 39984.4μs | 44480.5μs | 44862.1μs |

shuc -O0 pass timings
- Tokenization: 178.4μs
- Parsing: 45.0μs
- Type Checking: 54.9μs
- Short Circuitify: 17.8μs
- Remove Complex Operands: 14.3μs
- SIR Instruction Selection: 106.6μs
- Promote Phi: 85.6μs
- LLVM Codegen: 278.8μs
- Total compilation time: 1102.7μs

shuc -O1 pass timings
- Tokenization: 135.8μs
- Parsing: 37.0μs
- Type Checking: 42.4μs
- Short Circuitify: 13.2μs
- Remove Complex Operands: 11.1μs
- SIR Instruction Selection: 83.7μs
- Promote Phi: 66.2μs
- Optimization iterations for main: 2
- Optimizations: 466.9μs
- LLVM Codegen: 168.7μs
- Total compilation time: 1264.4μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2444.3μs | 2376.0μs | 2301.4μs |
| shuc -O1 | 2285.5μs | 2297.2μs | 2364.9μs |
