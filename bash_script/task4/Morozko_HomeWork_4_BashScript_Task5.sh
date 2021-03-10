#!/bin/bash

magicNumber=$(( $RANDOM % 100 ))

while [ true ]
do
    read -p "Let's try to win. Insert Number: " youTry
        if [[ "$youTry" < "$magicNumber" ]]
            then 
                echo "greather"
        elif [[ "$youTry" > "$magicNumber" ]]
            then echo "less"
        else
            echo "You win"
            break
        fi
done