# Report for programs/recursive-fibonacci.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 38182.5μs | 39412.5μs | 40266.0μs |
| shuc -O1 | 37253.1μs | 39853.5μs | 40713.0μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 37845.9μs | 39075.9μs | 39929.5μs |
| shuc -O1 | 36871.7μs | 39472.1μs | 40331.6μs |

shuc -O0 pass timings
- Tokenization: 20.9μs
- Parsing: 10.0μs
- Type Checking: 15.0μs
- Short Circuitify: 8.1μs
- Remove Complex Operands: 4.4μs
- SIR Instruction Selection: 21.7μs
- Promote Phi: 7.6μs
- LLVM Codegen: 91.4μs
- Total compilation time: 336.5μs

shuc -O1 pass timings
- Tokenization: 21.1μs
- Parsing: 10.0μs
- Type Checking: 15.4μs
- Short Circuitify: 8.1μs
- Remove Complex Operands: 4.4μs
- SIR Instruction Selection: 22.3μs
- Promote Phi: 7.6μs
- Optimization iterations for main: 1
- Optimization iterations for fibonacci: 1
- Optimizations: 50.1μs
- LLVM Codegen: 84.2μs
- Total compilation time: 381.4μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 1883.3μs | 1864.6μs | 1792.0μs |
| shuc -O1 | 1849.2μs | 1863.6μs | 1824.8μs |
