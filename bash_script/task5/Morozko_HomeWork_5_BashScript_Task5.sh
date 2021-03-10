#!/bin/bash

file=$@
read -a test_arr <<< $@
min=${test_arr[0]}
max=${test_arr[0]}

for i in ${test_arr[@]};do
if [ "$i" -gt "$max" ]; then
        max=$i
fi
if [ "$i" -lt "$min" ]; then
        min=$i
fi
done
echo "max=$max"
echo "min=$min"