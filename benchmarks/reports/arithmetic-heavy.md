# Report for programs/arithmetic-heavy.sl
Times determined by running each part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 55615.2μs | 53558.8μs | 52832.2μs |
| shuc -O1 | 50432.0μs | 57860.8μs | 53607.2μs |

shuc -O0 pass timings
- Tokenization: 20.6μs
- Parsing: 10.7μs
- Type Checking: 16.9μs
- Short Circuitify: 7.5μs
- Remove Complex Operands: 3.3μs
- SIR Instruction Selection: 13.4μs
- Promote Phi: 11.4μs
- LLVM Codegen: 117.3μs
- Total compilation time: 398.9μs

shuc -O1 pass timings
- Tokenization: 20.1μs
- Parsing: 9.3μs
- Type Checking: 14.8μs
- Short Circuitify: 6.3μs
- Remove Complex Operands: 3.1μs
- SIR Instruction Selection: 12.2μs
- Promote Phi: 10.0μs
- Optimizations: 57.7μs
- Optimization iterations: 2
- LLVM Codegen: 100.8μs
- Total compilation time: 413.6μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 97594.9μs | 2265.1μs | 2188.0μs |
| shuc -O1 | 97925.5μs | 2656.4μs | 2681.8μs |
