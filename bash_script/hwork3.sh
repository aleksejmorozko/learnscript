#!/bin/bash

echo '----------------------------exercise 1-------------------------------'
seq -s' ' 10 20


echo '----------------------------exercise 2-------------------------------'
i=20
while (( $i >= -20 )) 
do
    echo -n \ $i
    let i=$i-4
done
echo 

echo '----------------------------exercise 3-------------------------------'
array=$(seq 1 100)
for i in $array
do
    if (( `expr $i % 2` == 0 ))
        then
            if (( $i < 85))
                then
                    if (( $i < 30 )) || (( $i > 60 ))
                        then 
                            echo -n \ $i
                        fi
                fi
    fi
done
echo


echo '----------------------------exercise 4-------------------------------'
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

echo '----------------------------exercise 5-------------------------------'

magicNumber=$(( $RANDOM % 100 ))
echo $magicNumber
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


echo '----------------------------exercise 6-------------------------------'

while read filedirect
do 
    if [ "${filedirect: -1}" = "/" ]
        then 
            mkdir -p "${filedirect}"
        else 
            touch "${filedirect}"
    fi
done

echo '----------------------------exercise 7-------------------------------'
#-- in one line 
#-- ls -l | awk 'NR > 1 { print "filename: " $9 ", owner: " $3}'    #решение данной задачи без использования цикла
#----------------------------------------------------------------------------

ls -l | awk 'NR > 1 {print }' > /tmp/test                           #для решения данной задачи создаем временный файл, в который вносим список файлов

while read LINE;                                                    #функция определения файл - владелец
do
    echo "$LINE" | awk $'{print "filename: " $9 ", owner: " $3}'
done < /tmp/test
rm /tmp/test                                                        #удаление временного файла