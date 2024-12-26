#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <optimization_level> <filename1> <filename2>"
    exit 1
fi

optimization_level=$1
filename1=$2
filename2=$3

output_file="perf_stats${optimization_level}_${filename1}_${filename2}.csv"

echo "Run,Cycles,Instructions,Cache_Misses,Branches,Branch_Misses,Page_Faults,Context_Switches,CPU_Migrations,L1_DCache_Load_Misses,L1_ICache_Load_Misses,DTLB_Load_Misses,ITLB_Load_Misses,Time_Elapsed" > "$output_file"

extract_value() {
    echo "$1" | grep "$2" | awk '{print $1}' | sed 's/,//g'
}

for i in {1..1000}; do
    output=$(perf stat -e cycles,instructions,cache-misses,branches,branch-misses,page-faults,context-switches,cpu-migrations,L1-dcache-load-misses,L1-icache-load-misses,dTLB-load-misses,iTLB-load-misses ./levenshtein${optimization_level} data/${filename1} data/${filename2} 2>&1)

    cycles=$(extract_value "$output" "cpu_core/cycles/")
    instructions=$(extract_value "$output" "cpu_core/instructions/")
    cache_misses=$(extract_value "$output" "cpu_core/cache-misses/")
    branches=$(extract_value "$output" "cpu_core/branches/")
    branch_misses=$(extract_value "$output" "cpu_core/branch-misses/")
    page_faults=$(extract_value "$output" "page-faults")
    context_switches=$(extract_value "$output" "context-switches")
    cpu_migrations=$(extract_value "$output" "cpu-migrations")
    l1_dcache_load_misses=$(extract_value "$output" "cpu_core/L1-dcache-load-misses/")
    l1_icache_load_misses=$(extract_value "$output" "cpu_core/L1-icache-load-misses/")
    dtlb_load_misses=$(extract_value "$output" "cpu_core/dTLB-load-misses/")
    itlb_load_misses=$(extract_value "$output" "cpu_core/iTLB-load-misses/")
    time_elapsed=$(echo "$output" | grep "seconds time elapsed" | awk '{print $1}')

    echo "$i,$cycles,$instructions,$cache_misses,$branches,$branch_misses,$page_faults,$context_switches,$cpu_migrations,$l1_dcache_load_misses,$l1_icache_load_misses,$dtlb_load_misses,$itlb_load_misses,$time_elapsed" >> "$output_file"
done

echo "Stats saved to $output_file"