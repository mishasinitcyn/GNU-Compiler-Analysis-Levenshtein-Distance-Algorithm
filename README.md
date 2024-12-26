# GNU Compiler Optimization Analysis: Levenshtein Distance Algorithm

This repository contains an analysis of GNU compiler optimizations on the Levenshtein Distance algorithm, demonstrating significant performance improvements between optimization levels O0 and O1.

## Key Findings

- 35-50% runtime reduction between optimization levels O0 and O1
- 10-fold to 100-fold decrease in branch mispredictions for substring and duplicate sequence pairs
- Detailed analysis of optimization techniques including register allocation, loop optimization, and conditional moves

## Methodology

All evaluations were performed 1000 times on x86 architecture via SFU CSIL machines. The following sequence pairs were used as test inputs:
- Long-Long duplicate pair (edit distance: 0)
- Long-Long different pair (edit distance: 8230)
- Long-Short duplicate prefix pair (edit distance: 9536)

Performance metrics were recorded using the Perf tool, analyzing:
- Branch predictions
- Instruction counts
- Execution time
- Memory access patterns

## Implementation

The implementation uses a modified version of the Wikibooks Levenshtein distance algorithm, adapted to use heap allocation for the distance matrix to support longer sequences without stack overflow.

## Key Optimizations Analyzed

1. **Register Usage**
   - O0: Variables stored on stack
   - O1: Loop counters and temporary variables in registers (up to 200x faster reads)

2. **Loop Optimization**
   - Reduced loop overhead through pointer arithmetic
   - Efficient array access through register-based iteration

3. **Instruction Selection**
   - Improved use of Load Effective Address (LEA) instructions
   - Elimination of redundant register moves

4. **Conditional Moves**
   - Implementation of CMOVLE instruction
   - Analysis of branch prediction effectiveness

## Source Code Organization

- `src/`: Implementation of Levenshtein distance algorithm
- `analysis/`: Performance analysis scripts and results
- `docs/`: Detailed analysis report and findings

## Requirements

- GNU C Compiler
- Perf performance analysis tool
- x86 architecture for assembly analysis

## Usage

```bash
# Compile with no optimization
gcc -O0 levenshtein.c -o levenshtein_O0

# Compile with optimization level 1
gcc -O1 levenshtein.c -o levenshtein_O1

# Run performance analysis
./run_analysis.sh
```

## Citations

- Jurafsky and Martin, 2024
- Agner Fog's Optimization Manual
- Wikibooks Levenshtein Distance Implementation

## Author

Mikhail Sinitcyn  
<!-- Simon Fraser University -->