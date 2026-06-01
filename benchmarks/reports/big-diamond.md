# Report for programs/big-diamond.sl
Times determined by running each measure part 100 times then taking the average

Note that individual pass timings are NOT averaged out
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 130758.8μs | 107141.1μs | 106431.7μs |
| shuc -O1 | 439393.5μs | 440063.2μs | 441071.5μs |

shuc -O0 pass timings
- Tokenization: 19972 micro seconds
- Parsing: 2472 micro seconds
- Type Checking: 740 micro seconds
- Short Circuitify: 136 micro seconds
- Remove Complex Operands: 215 micro seconds
- SIR Instruction Selection: 2502 micro seconds
- Promote Phi: 2020 micro seconds
- LLVM Codegen: 6463 micro seconds
- Total compilation time: 34540 microseconds

shuc -O1 pass timings
- Tokenization: 19679 micro seconds
- Parsing: 2501 micro seconds
- Type Checking: 743 micro seconds
- Short Circuitify: 138 micro seconds
- Remove Complex Operands: 217 micro seconds
- SIR Instruction Selection: 2481 micro seconds
- Promote Phi: 1993 micro seconds
- Optimizations: 327173 micro seconds
- Optimization iterations: 2
- LLVM Codegen: 415 micro seconds
- Total compilation time: 355368 microseconds

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2373.7μs | 2316.8μs | 2390.7μs |
| shuc -O1 | 2330.5μs | 2212.0μs | 2350.1μs |
