#!/bin/bash

while [ true ]
do
    read -p " " name
        if grep -q 'stop' <<< "$name"
            then 
                break
            else   
                echo "Hello, $name"
        fi
done