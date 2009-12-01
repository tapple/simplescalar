#!/bin/bash
COMMAND='../simplesim-3.0/sim-outorder'
OUTPUT_DIR='run3'

TABLE_SIZES=$(echo {1..5})
TABLE_SIZES=${@:-$TABLE_SIZES}

gcc='cc1.alpha -O 1stmt.i'
anagram='anagram.alpha words < anagram.in > OUT'
go='go.alpha 50 9 2stone9.in > OUT'

BENCHMARK[1]='gcc'
BENCHMARK[2]='anagram'
BENCHMARK[3]='go'

BUF_SIZE[1]=8
BUF_SIZE[2]=16
BUF_SIZE[3]=32

TABLE_SIZE[1]=$((4 * 1024))
TABLE_SIZE[2]=$((8 * 1024))
TABLE_SIZE[3]=$((16 * 1024))
TABLE_SIZE[4]=$((32 * 1024))
TABLE_SIZE[5]=$((64 * 1024))

TABLE_ASSOC[1]=4
TABLE_ASSOC[2]=8
TABLE_ASSOC[3]=16

mkdir -p $OUTPUT_DIR

for table_size_i in $TABLE_SIZES; do
for table_assoc_i in {1..3}; do
for buf_size_i in {1..3}; do
for bench in {1..3}; do

    buf_size=${BUF_SIZE[$buf_size_i]}
    table_size=${TABLE_SIZE[$table_size_i]}
    table_assoc=${TABLE_ASSOC[$table_assoc_i]}
    table_sets=$((table_size / table_assoc))

    bench_name=${BENCHMARK[bench]}
    bench_opt=${!bench_name}

    cache_opt="-cache:dl2 dl2:512:64:4:l -cache:il2 il2:512:64:4:l"
    buf_opt="-cache:pbuffer pbuffer:1:32:$buf_size:l"
    table_opt="-prefetch:trace ptrace:$table_sets:8:$table_assoc:l"
    output_file=$(printf '%s/ts%05d-ta%02d-bs%02d-%s.txt\n' $OUTPUT_DIR $table_size $table_assoc $buf_size $bench_name)

    $COMMAND $cache_opt $table_opt $buf_opt $bench_opt 2> $output_file

done
done
done
done
