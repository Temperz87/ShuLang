# Report for programs/arithmetic-heavy.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 56850.3μs | 56943.6μs | 57751.2μs |
| shuc -O1 | 52410.8μs | 53082.6μs | 52899.2μs |

shuc -O0 pass timings
- Tokenization: 82.8μs
- Parsing: 18.9μs
- Type Checking: 27.6μs
- Short Circuitify: 9.6μs
- Remove Complex Operands: 3.0μs
- SIR Instruction Selection: 23.2μs
- Promote Phi: 14.7μs
- LLVM Codegen: 424.9μs
- Total compilation time: 633.0μs

shuc -O1 pass timings
- Tokenization: 58.0μs
- Parsing: 15.7μs
- Type Checking: 22.6μs
- Short Circuitify: 7.7μs
- Remove Complex Operands: 2.4μs
- SIR Instruction Selection: 19.0μs
- Promote Phi: 12.2μs
- Optimizations: 58.7μs
- Optimization iterations: 2
- LLVM Codegen: 358.0μs
- Total compilation time: 579.9μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 96430.1μs | 2561.7μs | 2526.8μs |
| shuc -O1 | 96113.1μs | 2513.9μs | 2540.1μs |
