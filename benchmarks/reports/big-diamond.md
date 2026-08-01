# Report for programs/big-diamond.sl
Times determined by running each part 10000 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 155309.1μs | 99987.1μs | 100012.8μs |
| shuc -O1 | 817436.7μs | 818997.4μs | 819081.5μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 124604.6μs | 69282.5μs | 69308.2μs |
| shuc -O1 | 53330.1μs | 54890.8μs | 54974.9μs |

shuc -O0 pass timings
- Tokenization: 6835.2μs
- Parsing: 1519.8μs
- Type Checking: 1324.1μs
- Short Circuitify: 225.3μs
- Remove Complex Operands: 340.4μs
- SIR Instruction Selection: 4468.5μs
- Promote Phi: 4440.0μs
- LLVM Codegen: 6997.8μs
- Total compilation time: 30704.6μs

shuc -O1 pass timings
- Tokenization: 6777.9μs
- Parsing: 1476.4μs
- Type Checking: 1306.5μs
- Short Circuitify: 219.9μs
- Remove Complex Operands: 339.5μs
- SIR Instruction Selection: 4252.5μs
- Promote Phi: 4204.1μs
- Optimizations: 744611.3μs
- Optimization iterations: 2
- LLVM Codegen: 387.9μs
- Total compilation time: 764106.6μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 1285.9μs | 1268.9μs | 1261.1μs |
| shuc -O1 | 1265.7μs | 1251.2μs | 1254.6μs |
