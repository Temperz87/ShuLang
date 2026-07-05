# Report for programs/huge-mixed-program.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 58235.6μs | 62693.6μs | 66106.9μs |
| shuc -O1 | 57752.1μs | 59396.7μs | 58403.6μs |

shuc -O0 pass timings
- Tokenization: 467.5μs
- Parsing: 64.4μs
- Type Checking: 69.5μs
- Short Circuitify: 19.6μs
- Remove Complex Operands: 17.3μs
- SIR Instruction Selection: 103.9μs
- Promote Phi: 86.0μs
- LLVM Codegen: 657.4μs
- Total compilation time: 1526.7μs

shuc -O1 pass timings
- Tokenization: 309.5μs
- Parsing: 42.8μs
- Type Checking: 47.0μs
- Short Circuitify: 12.6μs
- Remove Complex Operands: 11.2μs
- SIR Instruction Selection: 69.8μs
- Promote Phi: 59.5μs
- Optimizations for main: 1343.2μs
- Optimization iterations for main: 2
- LLVM Codegen: 375.4μs
- Total compilation time: 2305.2μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2594.8μs | 2583.1μs | 2509.6μs |
| shuc -O1 | 2537.1μs | 2591.3μs | 2643.5μs |
