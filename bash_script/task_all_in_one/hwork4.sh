#!/bin/bash
#echo '----------------------------exercise 1-------------------------------'
#user=$1
#echo $(getent passwd $user) | cut -d : -f 6

#echo '----------------------------exercise 2-------------------------------'
#ages=$1
#letter=$2 
#echo ${ages}
#echo ${letter}
#if (( ${ages} > 17 ))
#    then 
#        echo "You may go."
#    else 
#        if [ ${letter} = "yes" ]
#            then 
#                echo "You may go but must be back before midnight."
#            else
#                echo "You can't go."
#        fi
#fi

#echo '----------------------------exercise 3-------------------------------'
#direct=$1

#for t in $(ls -l ${direct} | awk 'NR > 1 {print $9}')
#do
#if [ -d "$1$t" ]
#    then         
#            echo "File: '$1$t'" 
#            echo "Type: directory"
#            echo "Permission: ("$(stat -c '%a' $1$t)'/'$(ls -ld $1$t | awk '{print $1}')")"
#            echo "---------------"        
#    else echo "File: '$1$t'" 
#            echo "Type: regular file"
#            echo "Permission: ("$(stat -c '%a' $1$t)'/'$(ls -ld $1$t | awk '{print $1}')")"
#            echo "---------------" 
#fi 
#done 

#echo '----------------------------exercise 4-------------------------------'
#file=$@
#read -a test_arr <<< $@
#sum=0
#prod=1
#for i in ${test_arr[@]}; do
#        sum=$(($sum + $i))
#        prod=$(($prod * $i))
#done
#echo "Sum: $sum"
#echo "Prod: $prod"

#echo '----------------------------exercise 5-------------------------------'

#file=$@
#read -a test_arr <<< $@
#min=${test_arr[0]}
#max=${test_arr[0]}

#for i in ${test_arr[@]};do
#if [ "$i" -gt "$max" ]; then
#        max=$i
#fi
#if [ "$i" -lt "$min" ]; then
#        min=$i
#fi
#done
#echo "max=$max"
#echo "min=$min"

#echo '----------------------------exercise 6-------------------------------'

#if [[ -z $(ps -ef | grep "[s]leep 1000") ]]; then
#        sleep 1000 & &> /dev/null
#fi
#--------------
#--------------watch -n 1 'ps -ef | grep "[s]leep 1000" '
#--------------for i in $(ps -ef | grep "[s]leep 1000" | awk '{print $2}'); do kill $i; done

echo '----------------------------exercise 7-------------------------------'
echo "$0"
echo $(basename $0)