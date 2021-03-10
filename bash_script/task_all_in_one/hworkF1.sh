#!/bin/bash

#Для работы с csv файлами установим утилиту csvtool. При помощи даннй утилиты очень удобно раскодировать (распарсить) csv файлы.
#создаем шаблон для будущего файла.
echo "id,location_id,organization_id,service_id,name,title,email,department" > accounts_new_mail.csv

#создаем шаблон без заголовка. С таким файлом проще работать.
cat accounts.csv | awk 'NR>1 {print $0}' > accounts_1.csv

#Делаем выборки из файлов по определенным полям, с которым нам проще работать.
cat accounts_1.csv | csvtool col 1-4 - > ./new_csv1   #выборка при помощи утилиты с 1 по 4 поле и занесение данных во временный файл
#редактирование поля содержащего имя и фамилию
cat accounts_1.csv | awk -F, '{ print $5 }' | awk -F"[ ]" '{print ","toupper(substr($1,1,1)) substr($1,2)" "(toupper(substr($2,1,1)) substr($2,2))","}'> ./new_csv2
#выборка оставшихся полей и занесение их в отдельный файл.
cat accounts_1.csv | csvtool col 6 - > new_csv3
#выбираем во временный файл оставшееся 8-е поле
cat accounts_1.csv | awk -F"[,]" '{ print "," $8 }'> ./new_csv5

#Создаем массив с шаблоном для почты для каждого пользователя
i=0
for name in $(cat accounts.csv | awk -F"[,]" 'NR>1 { print $5 }' | awk -F"[ ]" '{print tolower(substr($1,1,1)) tolower(substr($2,1))}'); do
  a[$i]=$name
  i=$i+1
done

#количество строк или длина массива. 
length=${#a[@]}
#перебираем массив и изменяем адрес при совпадении
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
   echo ","${a[$i]} >> new_csv4
done

#формируем результирубющий файл и удаляем временные файлы
paste new_csv1 new_csv2 new_csv3 new_csv4 new_csv5 > ./new_csv 
tr -d "\t" < ./new_csv >> ./accounts_new_mail.csv
rm new_csv new_csv1 new_csv2 new_csv3 new_csv4 new_csv5 accounts_1.csv