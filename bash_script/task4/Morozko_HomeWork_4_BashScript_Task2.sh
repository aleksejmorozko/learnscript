#!/bin/bash
# Develop simple script which will be print numbers in range from 20 to -20 
# with step=4. (Hint: try to use echo {80..100}; echo {80..100..3})

i=20
while (( $i >= -20 )) 
do
    echo -n \ $i
    let i=$i-4
done
echo 