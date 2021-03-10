#!/bin/bash

direct=$1

for t in $(ls -l ${direct} | awk 'NR > 1 {print $9}')
do
if [ -d "$1$t" ]
    then         
            echo "File: '$1/$t'" 
            echo "Type: directory"
            echo "Permission: ("$(stat -c '%a' $1/$t)'/'$(ls -ld $1/$t | awk '{print $1}')")"
            echo "---------------"        
    else echo "File: '$1/$t'" 
            echo "Type: regular file"
            echo "Permission: ("$(stat -c '%a' $1/$t)'/'$(ls -ld $1/$t | awk '{print $1}')")"
            echo "---------------" 
fi 
done 