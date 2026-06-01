# Report for programs/big-diamond.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 129920.5μs | 104317.3μs | 103140.3μs |
| shuc -O1 | 438117.5μs | 439950.9μs | 440722.5μs |

shuc -O0 pass timings
- Tokenization: 24029.3μs
- Parsing: 3055.9μs
- Type Checking: 868.3μs
- Short Circuitify: 155.4μs
- Remove Complex Operands: 253.5μs
- SIR Instruction Selection: 3048.5μs
- Promote Phi: 2623.3μs
- LLVM Codegen: 8646.6μs
- Total compilation time: 42707.9μs

shuc -O1 pass timings
- Tokenization: 20547.2μs
- Parsing: 2567.2μs
- Type Checking: 752.9μs
- Short Circuitify: 141.2μs
- Remove Complex Operands: 218.6μs
- SIR Instruction Selection: 2562.9μs
- Promote Phi: 2116.7μs
- Optimizations: 338732.2μs
- Optimization iterations: 2.0
- LLVM Codegen: 567.6μs
- Total compilation time: 368238.7μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2639.0μs | 2523.4μs | 2510.6μs |
| shuc -O1 | 2461.9μs | 2448.0μs | 2390.9μs |
