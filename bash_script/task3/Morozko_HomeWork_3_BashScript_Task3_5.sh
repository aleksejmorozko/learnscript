#!/bin/bash

function rand() {
    echo $(($RANDOM % ${1}))
} 

for item in `seq 1 10`
do
    value="$(rand 100)"
    echo "[$item] => ${value}"
done 1>./test											#в данном упражнении я скопировал вывод работы функции из потока вывода
														#во временный файл test.txt
cat ./test												#вывод информации из файла (вывод как в примере)

awk '{print $3}' ./test > ./test1						#преобразование файла с последущим сохранением в файл test1.txt (т.к. файл сожержит лишние символы)
readarray test_array < ./test1							#занесение данных из файла test1.txt в массив test_array 
rm test test1											#удаление временных файлов

max=test_array[0]										#поиск max, min, sum
min=test_array[0]
sum=0

for i in ${test_array[@]}
do
	if [[ $i -gt $max ]] ; then
		max=$i
	fi
	if [[ $i -lt $min ]] ; then
		min=$i
	fi
	sum=$(($sum+$i))
done
echo "max=$max"
echo "min=$min"
echo "sum=$sum"