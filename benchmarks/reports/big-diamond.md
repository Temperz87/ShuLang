# Report for programs/big-diamond.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 92392.2μs | 71609.4μs | 75554.6μs |
| shuc -O1 | 79611.2μs | 79510.0μs | 79464.2μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 70567.1μs | 49784.3μs | 53729.5μs |
| shuc -O1 | 39748.3μs | 39647.2μs | 39601.3μs |

shuc -O0 pass timings
- Tokenization: 4338.2μs
- Parsing: 1025.8μs
- Type Checking: 770.1μs
- Short Circuitify: 142.4μs
- Remove Complex Operands: 225.2μs
- SIR Instruction Selection: 3177.3μs
- Promote Phi: 2683.6μs
- LLVM Codegen: 6100.2μs
- Total compilation time: 21825.1μs

shuc -O1 pass timings
- Tokenization: 4322.5μs
- Parsing: 1012.9μs
- Type Checking: 751.1μs
- Short Circuitify: 138.3μs
- Remove Complex Operands: 220.3μs
- SIR Instruction Selection: 2898.8μs
- Promote Phi: 2382.8μs
- Optimization iterations for main: 2
- Optimizations: 27691.4μs
- LLVM Codegen: 261.1μs
- Total compilation time: 39862.8μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2291.5μs | 2355.8μs | 2475.7μs |
| shuc -O1 | 2233.8μs | 2260.6μs | 2342.7μs |
