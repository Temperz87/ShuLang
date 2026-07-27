# Report for programs/big-diamond.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 121263.2μs | 84804.9μs | 82033.8μs |
| shuc -O1 | 460768.8μs | 463028.1μs | 462330.0μs |

shuc -O0 pass timings
- Tokenization: 4334.6μs
- Parsing: 1040.2μs
- Type Checking: 780.2μs
- Short Circuitify: 136.5μs
- Remove Complex Operands: 218.8μs
- SIR Instruction Selection: 2838.8μs
- Promote Phi: 3015.2μs
- LLVM Codegen: 5055.6μs
- Total compilation time: 20959.4μs

shuc -O1 pass timings
- Tokenization: 4252.3μs
- Parsing: 1005.5μs
- Type Checking: 764.8μs
- Short Circuitify: 134.9μs
- Remove Complex Operands: 218.5μs
- SIR Instruction Selection: 2833.1μs
- Promote Phi: 2520.7μs
- Optimizations: 376553.2μs
- Optimization iterations: 2
- LLVM Codegen: 274.7μs
- Total compilation time: 388766.8μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2444.9μs | 2600.2μs | 2649.2μs |
| shuc -O1 | 2689.6μs | 2466.4μs | 2504.1μs |
