# Report for programs/arithmetic-heavy.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 57750.5μs | 59083.8μs | 58723.3μs |
| shuc -O1 | 51609.3μs | 53005.5μs | 53104.0μs |

shuc -O0 pass timings
- Tokenization: 37.1μs
- Parsing: 16.5μs
- Type Checking: 25.9μs
- Short Circuitify: 11.0μs
- Remove Complex Operands: 4.9μs
- SIR Instruction Selection: 20.7μs
- Promote Phi: 16.0μs
- LLVM Codegen: 169.5μs
- Total compilation time: 581.3μs

shuc -O1 pass timings
- Tokenization: 20.8μs
- Parsing: 10.7μs
- Type Checking: 17.7μs
- Short Circuitify: 7.7μs
- Remove Complex Operands: 3.3μs
- SIR Instruction Selection: 15.1μs
- Promote Phi: 11.2μs
- Optimizations: 60.6μs
- Optimization iterations: 2
- LLVM Codegen: 121.0μs
- Total compilation time: 480.0μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 97502.4μs | 2832.1μs | 2730.5μs |
| shuc -O1 | 97352.6μs | 2787.3μs | 2770.0μs |
