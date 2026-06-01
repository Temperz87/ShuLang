# Report for programs/arithmetic-heavy.sl
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 49137μs | 50881μs | 51488μs |
| shuc -O1 | 49993μs | 46677μs | 46103μs |

shuc -O0 pass timings
- Tokenization: 43 micro seconds
- Parsing: 13 micro seconds
- Type Checking: 12 micro seconds
- Short Circuitify: 3 micro seconds
- Remove Complex Operands: 1 micro seconds
- SIR Instruction Selection: 8 micro seconds
- Promote Phi: 7 micro seconds
- LLVM Codegen: 181 micro seconds
- Total compilation time: 286 microseconds

shuc -O1 pass timings
- Tokenization: 44 micro seconds
- Parsing: 12 micro seconds
- Type Checking: 12 micro seconds
- Short Circuitify: 3 micro seconds
- Remove Complex Operands: 1 micro seconds
- SIR Instruction Selection: 10 micro seconds
- Promote Phi: 7 micro seconds
- Optimizations: 44 micro seconds
- Optimization iterations: 2
- LLVM Codegen: 160 micro seconds
- Total compilation time: 311 microseconds

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 88903.3μs | 2054.4μs | 1823.1μs |
| shuc -O1 | 89377.4μs | 2148.3μs | 1927.8μs |
