# Report for programs/big-diamond.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 128451.0μs | 103139.7μs | 103260.4μs |
| shuc -O1 | 426112.2μs | 427094.6μs | 427345.2μs |

shuc -O0 pass timings
- Tokenization: 24477.6μs
- Parsing: 3092.5μs
- Type Checking: 935.8μs
- Short Circuitify: 158.1μs
- Remove Complex Operands: 257.4μs
- SIR Instruction Selection: 3141.9μs
- Promote Phi: 2656.2μs
- LLVM Codegen: 8432.5μs
- Total compilation time: 43176.1μs

shuc -O1 pass timings
- Tokenization: 20449.6μs
- Parsing: 2549.9μs
- Type Checking: 729.0μs
- Short Circuitify: 131.2μs
- Remove Complex Operands: 215.2μs
- SIR Instruction Selection: 2515.4μs
- Promote Phi: 2013.9μs
- Optimizations: 328430.6μs
- Optimization iterations: 2
- LLVM Codegen: 692.3μs
- Total compilation time: 357755.4μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2608.5μs | 2577.2μs | 2577.0μs |
| shuc -O1 | 2564.1μs | 2472.6μs | 2490.2μs |
