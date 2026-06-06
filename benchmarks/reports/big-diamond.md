# Report for programs/big-diamond.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 99836.3μs | 78229.4μs | 79076.2μs |
| shuc -O1 | 397075.9μs | 398065.0μs | 397971.6μs |

shuc -O0 pass timings
- Tokenization: 12058.0μs
- Parsing: 946.1μs
- Type Checking: 722.6μs
- Short Circuitify: 121.1μs
- Remove Complex Operands: 200.1μs
- SIR Instruction Selection: 2493.7μs
- Promote Phi: 2079.7μs
- LLVM Codegen: 6396.3μs
- Total compilation time: 25038.0μs

shuc -O1 pass timings
- Tokenization: 12143.9μs
- Parsing: 917.6μs
- Type Checking: 712.0μs
- Short Circuitify: 130.7μs
- Remove Complex Operands: 205.9μs
- SIR Instruction Selection: 2514.1μs
- Promote Phi: 2033.8μs
- Optimizations: 314278.3μs
- Optimization iterations: 2
- LLVM Codegen: 627.4μs
- Total compilation time: 333593.4μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2077.0μs | 2039.5μs | 1965.8μs |
| shuc -O1 | 2112.5μs | 1867.2μs | 1874.9μs |
