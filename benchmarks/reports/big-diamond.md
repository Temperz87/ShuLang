# Report for programs/big-diamond.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 121440.1μs | 101149.7μs | 99226.3μs |
| shuc -O1 | 418661.6μs | 420938.3μs | 420452.3μs |

shuc -O0 pass timings
- Tokenization: 23422.7μs
- Parsing: 1122.2μs
- Type Checking: 870.8μs
- Short Circuitify: 152.0μs
- Remove Complex Operands: 249.5μs
- SIR Instruction Selection: 3084.2μs
- Promote Phi: 2636.3μs
- LLVM Codegen: 7970.2μs
- Total compilation time: 39533.4μs

shuc -O1 pass timings
- Tokenization: 20455.9μs
- Parsing: 956.7μs
- Type Checking: 750.8μs
- Short Circuitify: 133.0μs
- Remove Complex Operands: 218.9μs
- SIR Instruction Selection: 2598.2μs
- Promote Phi: 2125.7μs
- Optimizations: 325139.9μs
- Optimization iterations: 2
- LLVM Codegen: 502.8μs
- Total compilation time: 352910.9μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2496.5μs | 2462.1μs | 2420.7μs |
| shuc -O1 | 2506.6μs | 2361.3μs | 2410.7μs |
