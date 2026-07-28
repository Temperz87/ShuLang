# Report for programs/big-diamond.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 89657.7μs | 66010.0μs | 66287.2μs |
| shuc -O1 | 374821.3μs | 375514.9μs | 375836.6μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 70896.0μs | 47248.3μs | 47525.5μs |
| shuc -O1 | 38754.3μs | 39447.9μs | 39769.7μs |

shuc -O0 pass timings
- Tokenization: 4315.5μs
- Parsing: 1002.4μs
- Type Checking: 746.3μs
- Short Circuitify: 139.3μs
- Remove Complex Operands: 230.6μs
- SIR Instruction Selection: 2713.9μs
- Promote Phi: 2256.6μs
- LLVM Codegen: 4182.3μs
- Total compilation time: 18761.8μs

shuc -O1 pass timings
- Tokenization: 4305.9μs
- Parsing: 1056.5μs
- Type Checking: 742.3μs
- Short Circuitify: 135.1μs
- Remove Complex Operands: 218.2μs
- SIR Instruction Selection: 2677.6μs
- Promote Phi: 2094.5μs
- Optimizations: 324160.7μs
- Optimization iterations: 2
- LLVM Codegen: 254.5μs
- Total compilation time: 336067.0μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2605.5μs | 2502.8μs | 2564.6μs |
| shuc -O1 | 2586.5μs | 2425.1μs | 2544.2μs |
