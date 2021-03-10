#!/bin/bash

file=$@
read -a test_arr <<< $@
sum=0
prod=1
for i in ${test_arr[@]}; do
        sum=$(($sum + $i))
        prod=$(($prod * $i))
done
echo "Sum: $sum"
echo "Prod: $prod"