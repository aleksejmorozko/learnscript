#!/bin/bash
echo '----------------------------exercise 1-------------------------------'
learnYearMonth=(31 28 31 30 31 30 31 31 30 31 30 31)				#формирование массива
echo ${learnYearMonth[$(date +'%m') - 1]}							#получение информации о количестве дней в текущем месяце

echo '----------------------------exercise 2-------------------------------'
learnYearMonth=(31 28 31 30 31 30 31 31 30 31 30 31)				#альтернативный вариант получения информации
case $(date +'%m') in												#с использованием инструкции case 
	'1')
		echo $learnYearMonth[0]
		;;
	'2')
		echo ${learnYearMonth[1]}
		;;
	'3')
		echo ${learnYearMonth[2]}
		;;
	'4')
		echo ${learnYearMonth[3]}
		;;
	'5')
		echo ${learnYearMonth[4]}
		;;
	'6')
		echo ${learnYearMonth[5]}
		;;
	'7')
		echo ${learnYearMonth[6]}
		;;
	'8')
		echo ${learnYearMonth[7]}
		;;
	'9')
		echo ${learnYearMonth[8]}
		;;
	'10')
		echo ${learnYearMonth[9]}
		;;
	'11')
		echo ${learnYearMonth[10]}
		;;
	*)
		echo ${learnYearMonth[11]}
		;;
esac

echo '----------------------------exercise 3-------------------------------'
for t in $(ps -ef | grep cups | awk $'{print $8}')					#в данном примере я использую рабочий демон 
do																	#cupsd, т.к. демон apache не работает
if grep -q 'cupsd' <<< "$t"; then 
	echo "Сервис cups работает"
fi
done

echo '----------------------------exercise 4-------------------------------'
cat /etc/shadow &>/dev/null											#проверка доступа к файлу /etc/shadow
if [ $? -eq 0 ]
	then
		echo "can touch files"
	else 
		echo "files can't touch"
fi

echo '----------------------------exercise 5-------------------------------'
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

max=$test_array[0]										#поиск max, min, sum
min=$test_array[0]
sum=0

for i in ${test_array[@]}
do
	if [[ $i > $max ]] ; then
		max=$i
	fi
	if [[ $i < $min ]] ; then
		min=$i
	fi
	sum=$(($sum+$i))
done
echo "max=$max"
echo "min=$min"
echo "sum=$sum"