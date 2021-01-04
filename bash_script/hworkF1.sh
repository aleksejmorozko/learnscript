#!/bin/bash

cat ./accounts.csv | awk 'NR < 2' > accounts_new.csv

cat accounts.csv | awk -F"," 'NR>1 { print $1 "," $2 "," $3 "," $4 "," }'> ./new_csv1
cat accounts.csv | awk -F"," 'NR>1 { print $5 }' | awk -F"[ ]" '{print toupper(substr($1,1,1)) substr($1,2)" "(toupper(substr($2,1,1)) substr($2,2))}'> ./new_csv2
cat accounts.csv | awk -F"," 'NR>1 { print "," $6 "," }'> ./new_csv3
# cat accounts.csv | awk -F"[,]" 'NR>1 { print $5 }' | awk -F"[ ]" '{print tolower(substr($1,1,1)) toupper(substr($2,1,1)) tolower(substr($2,2)) "@abc"}'> ./new_csv4

i=0
for name in $(cat accounts.csv | awk -F"[,]" 'NR>1 { print $5 }' | awk -F"[ ]" '{print tolower(substr($1,1,1)) tolower(substr($2,1))}'); do
  a[$i]=$name
  i=$i+1
done

length=${#a[@]}
for (( i=0; i < $length; i++))
do
    s=0
    for (( j=$i ; j < $length; j++))
    do
        if [ ${a[$i]} == ${a[$j]} ]
         then 
            let s=$s+1
            if [ $s \> 1 ]
             then 
                a[$j]+="$s"              
            fi
        fi
    done
done
for (( i=0; i < $length; i++ ))
do
   a[$i]+="@abc"
   echo ${a[$i]} >> new_csv4
done

cat accounts.csv | awk -F"[,]" 'NR>1 { print "," $8 }'> ./new_csv5

paste new_csv1 new_csv2 new_csv3 new_csv4 new_csv5 > ./new_csv 
tr -d "\t" < ./new_csv >> ./accounts_new.csv
# rm new_csv new_csv1 new_csv2 new_csv3 new_csv4 new_csv5