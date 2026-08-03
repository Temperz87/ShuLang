# Report for programs/big-diamond.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 92655.8μs | 69289.1μs | 69134.6μs |
| shuc -O1 | 82979.0μs | 89524.9μs | 83776.4μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 71958.7μs | 48592.0μs | 48437.5μs |
| shuc -O1 | 40891.2μs | 47437.1μs | 41688.6μs |

shuc -O0 pass timings
- Tokenization: 4254.5μs
- Parsing: 1011.4μs
- Type Checking: 760.1μs
- Short Circuitify: 142.8μs
- Remove Complex Operands: 222.8μs
- SIR Instruction Selection: 2874.0μs
- Promote Phi: 2324.2μs
- LLVM Codegen: 5703.3μs
- Total compilation time: 20697.1μs

shuc -O1 pass timings
- Tokenization: 4303.4μs
- Parsing: 1079.7μs
- Type Checking: 811.0μs
- Short Circuitify: 143.6μs
- Remove Complex Operands: 223.3μs
- SIR Instruction Selection: 3077.9μs
- Promote Phi: 2618.6μs
- Optimization iterations for main: 2
- Optimizations: 29365.3μs
- LLVM Codegen: 272.4μs
- Total compilation time: 42087.9μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2416.5μs | 2326.9μs | 2315.8μs |
| shuc -O1 | 2290.5μs | 2290.3μs | 2343.2μs |
