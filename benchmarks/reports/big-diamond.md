# Report for programs/big-diamond.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 128197.1μs | 97583.1μs | 96096.8μs |
| shuc -O1 | 444507.3μs | 445517.3μs | 449359.7μs |

shuc -O0 pass timings
- Tokenization: 13326.1μs
- Parsing: 1277.8μs
- Type Checking: 864.2μs
- Short Circuitify: 158.5μs
- Remove Complex Operands: 249.8μs
- SIR Instruction Selection: 3272.6μs
- Promote Phi: 3288.5μs
- LLVM Codegen: 9865.6μs
- Total compilation time: 32356.7μs

shuc -O1 pass timings
- Tokenization: 12204.8μs
- Parsing: 1010.6μs
- Type Checking: 794.5μs
- Short Circuitify: 146.2μs
- Remove Complex Operands: 238.8μs
- SIR Instruction Selection: 2735.7μs
- Promote Phi: 2472.1μs
- Optimizations for main: 354587.2μs
- Optimization iterations for main: 2
- LLVM Codegen: 445.8μs
- Total compilation time: 374685.8μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2773.3μs | 2515.2μs | 2301.8μs |
| shuc -O1 | 2623.2μs | 2442.6μs | 2445.5μs |
