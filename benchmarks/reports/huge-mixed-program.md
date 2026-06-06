# Report for programs/huge-mixed-program.sl
Times determined by running each measure part 100 times then taking the average
## COMPILATION TIMING
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 58287.1μs | 61473.4μs | 64349.4μs |
| shuc -O1 | 55556.3μs | 60500.5μs | 57833.8μs |

shuc -O0 pass timings
- Tokenization: 1036.0μs
- Parsing: 75.1μs
- Type Checking: 78.5μs
- Short Circuitify: 21.8μs
- Remove Complex Operands: 18.9μs
- SIR Instruction Selection: 119.8μs
- Promote Phi: 97.6μs
- LLVM Codegen: 743.3μs
- Total compilation time: 2218.0μs

shuc -O1 pass timings
- Tokenization: 542.6μs
- Parsing: 41.3μs
- Type Checking: 45.2μs
- Short Circuitify: 12.5μs
- Remove Complex Operands: 10.6μs
- SIR Instruction Selection: 69.4μs
- Promote Phi: 52.7μs
- Optimizations: 1231.3μs
- Optimization iterations: 2
- LLVM Codegen: 378.9μs
- Total compilation time: 2402.9μs
## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 2511.1μs | 2580.2μs | 2544.4μs |
| shuc -O1 | 2417.3μs | 2329.9μs | 2513.2μs |
