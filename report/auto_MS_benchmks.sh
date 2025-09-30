#!/bin/bash
# This script will run macsim on each of the BM.txt files in the benchmarks
# output file is not formatted for handing in atm

TFL=../bin/trace_file_list
OUT=../report/auto_MS.txt

bench_name=("median" "memBW" "memcpy" "memlatency" "mergesort" "multiply" "qsort" "rsort" "spmv" "st-matmul" "st-vvadd" "towers" "vvadd")

#for some reason, macsim refuses to work properly unless you are in /bin/
cd ../bin/

echo "begin" > $OUT

for bench in "${bench_name[@]}"
do
    echo "onto ${bench}"
    
    # first set up trace_file_list
    echo "1" > $TFL             # this 1 is required, read macsim.pdf, sect 2.3
    echo "../tools/benchmarks/${bench}/BM.txt" >> $TFL

    # now run macsim and take the 4th last line
    echo "${bench} has $(./macsim | tail -n 4 | head -n 1)" >> $OUT
done

echo "done!"