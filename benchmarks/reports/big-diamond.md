# Report for programs/big-diamond.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 141296.8μs | 141724.1μs | 143498.7μs |
| shuc -O1 | 447908.7μs | 447147.9μs | 449189.6μs |

shuc -O0 pass timings
- Tokenization: 4529.8μs
- Parsing: 1068.1μs
- Type Checking: 812.8μs
- Short Circuitify: 147.1μs
- Remove Complex Operands: 231.9μs
- SIR Instruction Selection: 2988.9μs
- Promote Phi: 2626.4μs
- LLVM Codegen: 4875.7μs
- Total compilation time: 20012.9μs

shuc -O1 pass timings
- Tokenization: 4301.6μs
- Parsing: 1036.3μs
- Type Checking: 752.5μs
- Short Circuitify: 132.3μs
- Remove Complex Operands: 214.2μs
- SIR Instruction Selection: 2704.0μs
- Promote Phi: 2245.5μs
- Optimizations: 339206.1μs
- Optimization iterations: 2
- LLVM Codegen: 256.0μs
- Total compilation time: 350995.2μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2180.2μs | 2017.5μs | 2251.7μs |
| shuc -O1 | 2253.4μs | 2213.6μs | 2000.0μs |
