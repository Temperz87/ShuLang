# Report for programs/big-diamond.sl
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 115601μs | 89626μs | 88463μs |
| shuc -O1 | 414359μs | 414870μs | 416191μs |

shuc -O0 pass timings
- Tokenization: 18732 micro seconds
- Parsing: 2420 micro seconds
- Type Checking: 675 micro seconds
- Short Circuitify: 131 micro seconds
- Remove Complex Operands: 194 micro seconds
- SIR Instruction Selection: 2467 micro seconds
- Promote Phi: 2957 micro seconds
- LLVM Codegen: 6106 micro seconds
- Total compilation time: 33707 microseconds

shuc -O1 pass timings
- Tokenization: 18560 micro seconds
- Parsing: 2426 micro seconds
- Type Checking: 749 micro seconds
- Short Circuitify: 121 micro seconds
- Remove Complex Operands: 204 micro seconds
- SIR Instruction Selection: 2448 micro seconds
- Promote Phi: 2246 micro seconds
- Optimizations: 322069 micro seconds
- Optimization iterations: 2
- LLVM Codegen: 315 micro seconds
- Total compilation time: 349169 microseconds

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 1884.3μs | 1963.8μs | 1891.1μs |
| shuc -O1 | 1867.0μs | 1989.6μs | 1886.2μs |
