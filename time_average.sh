#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <optimization_level> <filename1> <filename2>"
    exit 1
fi

optimization_level=$1
filename1=$2
filename2=$3

output_file="time_stats${optimization_level}_${filename1}_${filename2}.csv"

echo "Run,CPU_Time_Used" > $output_file

for i in {1..1000}
do
    output=$(./levenshtein${optimization_level} data/${filename1} data/${filename2})
    cpu_time=$(echo "$output" | grep "Time taken:" | awk '{print $3}')
    echo "$i,$cpu_time" >> $output_file
done

echo "Benchmark complete. Results saved in $output_file"