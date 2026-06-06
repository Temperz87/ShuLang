# Report for programs/arithmetic-heavy.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 44588.8μs | 45736.4μs | 44802.6μs |
| shuc -O1 | 43947.0μs | 45247.0μs | 45262.1μs |

shuc -O0 pass timings
- Tokenization: 29.2μs
- Parsing: 8.9μs
- Type Checking: 11.7μs
- Short Circuitify: 3.8μs
- Remove Complex Operands: 1.2μs
- SIR Instruction Selection: 10.3μs
- Promote Phi: 6.5μs
- LLVM Codegen: 189.5μs
- Total compilation time: 277.7μs

shuc -O1 pass timings
- Tokenization: 28.7μs
- Parsing: 8.6μs
- Type Checking: 11.4μs
- Short Circuitify: 3.5μs
- Remove Complex Operands: 1.0μs
- SIR Instruction Selection: 10.1μs
- Promote Phi: 6.5μs
- Optimizations: 44.8μs
- Optimization iterations: 2
- LLVM Codegen: 181.7μs
- Total compilation time: 313.9μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 89768.3μs | 1994.3μs | 1956.7μs |
| shuc -O1 | 90834.4μs | 1939.0μs | 1970.3μs |
