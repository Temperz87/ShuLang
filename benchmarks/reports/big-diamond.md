# Report for programs/big-diamond.sl
Times determined by running each part 100 times then taking the average

## COMPILATION TIMING
shuc + clang timings
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 96287.8μs | 70005.9μs | 70230.2μs |
| shuc -O1 | 81289.1μs | 82676.4μs | 82656.6μs |

clang timings alone
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 73348.5μs | 47066.6μs | 47290.9μs |
| shuc -O1 | 36987.6μs | 38374.9μs | 38355.1μs |

shuc -O0 pass timings
- Tokenization: 4024.6μs
- Parsing: 968.0μs
- Type Checking: 3171.6μs
- Short Circuitify: 131.6μs
- Remove Complex Operands: 205.3μs
- SIR Instruction Selection: 2937.4μs
- Promote Phi: 2432.5μs
- LLVM Codegen: 5828.8μs
- Total compilation time: 22939.3μs

shuc -O1 pass timings
- Tokenization: 4058.3μs
- Parsing: 993.2μs
- Type Checking: 3174.9μs
- Short Circuitify: 130.9μs
- Remove Complex Operands: 206.1μs
- SIR Instruction Selection: 2885.2μs
- Promote Phi: 2514.5μs
- Optimization iterations for main: 2
- Optimizations: 29887.4μs
- LLVM Codegen: 262.2μs
- Total compilation time: 44301.5μs

## EXECUTION TIME
|  | clang -O0 | clang -O1 | clang -O2 |
| --- | --- | --- | --- |
| shuc -O0 | 1917.9μs | 2007.0μs | 1853.5μs |
| shuc -O1 | 1820.0μs | 1828.7μs | 1911.5μs |
