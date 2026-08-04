# Report for programs/huge-mixed-program.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 38700.6μs | 43764.8μs | 44896.1μs |
| shuc -O1 | 40804.9μs | 45151.5μs | 45132.0μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 37896.4μs | 42960.6μs | 44091.9μs |
| shuc -O1 | 39607.9μs | 43954.5μs | 43935.0μs |

shuc -O0 pass timings
- Tokenization: 130.8μs
- Parsing: 31.6μs
- Type Checking: 38.1μs
- Short Circuitify: 11.1μs
- Remove Complex Operands: 10.3μs
- SIR Instruction Selection: 80.1μs
- Promote Phi: 66.5μs
- LLVM Codegen: 204.7μs
- Total compilation time: 804.2μs

shuc -O1 pass timings
- Tokenization: 132.1μs
- Parsing: 31.4μs
- Type Checking: 39.3μs
- Short Circuitify: 11.7μs
- Remove Complex Operands: 10.7μs
- SIR Instruction Selection: 77.9μs
- Promote Phi: 63.7μs
- Optimization iterations for main: 2
- Optimizations: 438.3μs
- LLVM Codegen: 164.8μs
- Total compilation time: 1197.0μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 1939.2μs | 1915.7μs | 2032.7μs |
| shuc -O1 | 1910.9μs | 1950.0μs | 1889.3μs |
