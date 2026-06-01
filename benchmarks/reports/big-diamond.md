# Report for programs/big-diamond.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 130231.1μs | 104794.8μs | 105773.9μs |
| shuc -O1 | 448022.8μs | 448471.0μs | 448043.1μs |

shuc -O0 pass timings
- Tokenization: 23215.6μs
- Parsing: 3102.4μs
- Type Checking: 864.8μs
- Short Circuitify: 155.4μs
- Remove Complex Operands: 251.0μs
- SIR Instruction Selection: 3048.0μs
- Promote Phi: 2869.3μs
- LLVM Codegen: 8924.4μs
- Total compilation time: 42465.4μs

shuc -O1 pass timings
- Tokenization: 20647.3μs
- Parsing: 2645.0μs
- Type Checking: 771.2μs
- Short Circuitify: 133.6μs
- Remove Complex Operands: 218.9μs
- SIR Instruction Selection: 2612.6μs
- Promote Phi: 2275.1μs
- Optimizations: 346662.1μs
- Optimization iterations: 2
- LLVM Codegen: 466.7μs
- Total compilation time: 376467.8μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2584.8μs | 2579.2μs | 2527.6μs |
| shuc -O1 | 2538.2μs | 2546.6μs | 2527.4μs |
