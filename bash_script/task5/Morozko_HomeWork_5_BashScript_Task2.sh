#!/bin/bash

ages=$1
letter=$2 
echo ${ages}
echo ${letter}
if (( ${ages} > 17 ))
    then 
        echo "You may go."
    else 
        if [ ${letter} = "yes" ]
            then 
                echo "You may go but must be back before midnight."
            else
                echo "You can't go."
        fi
fi