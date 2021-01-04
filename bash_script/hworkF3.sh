#!/bin/bash
#Для работы с csv файлами установим утилиту cdvtool. При помощи даннй утилиты очень удобно раскодировать (распарсить) csv файлы.
#создаем шаблон для будущего файла.
echo "id,location_id,organization_id,service_id,name,userid,title,email,department" > accounts_new_uname.csv

#создаем шаблон без заголовка. С таким файлом проще работать.
cat accounts.csv | awk 'NR>1 {print $0}' > accounts_1.csv

#Делаем выборки из файлов по определенным полям, с которым нам проще работать.
cat accounts_1.csv | csvtool col 1-4 - > ./new_csv1   #выборка при помощи утилиты с 1 по 4 поле и занесение данных во временный файл
#редактирование поля содержащего имя и фамилию
cat accounts_1.csv | awk -F, '{ print $5 }' | awk -F"[ ]" '{print toupper(substr($1,1,1)) substr($1,2)" "(toupper(substr($2,1,1)) substr($2,2))","}'> ./new_csv2
#выборка оставшихся полей и занесение их в отдельный файл.
cat accounts_1.csv | csvtool col 6-8 - > new_csv4

#формируем два массива. "a1" - массив "имя_фамилия" (контроль совпадений) и массив "a2" - предполагаемый логин
a1=($(cat "new_csv2" | awk -F"[ ]" '{print $1"_"$2}'))
#---------------
a2=($(cat accounts_1.csv | awk -F, '{ print $5 }' | awk -F"[ ]" '{print tolower(substr($1,1,1)) tolower(substr($2,1))}'))
#---------------
#количество строк или длина массива. 
length=${#a1[@]}

#добавляем массив b - масиив, в котором содержится информация уникальности. 
#При совпадениях предполагаемого логина и не совпадении имени, уникальность увеличиваем.
#начальная уникальность равна 0
declare -a b
for (( i=0; i < $length; i++))
do
let b[$i]=0
done

#делаем перебор массива и увеличиваем уникальность по условиям
for (( i=0; i < $length; i++))
do
    for (( j=$i ; j < $length; j++))
    do
        if [ ${a2[$i]} == ${a2[$j]} ]
         then 
             if [ ${a1[$i]} != ${a1[$j]} ]
                then
                     if [ ${b[$i]} == ${b[$j]} ]
                        then
                            let b[$j]=${b[$j]}+1
                    fi
                fi
        fi
    done
done
#создаем временный файл для уникальных логинов
>csv3
#Определяем уникальность каждого логина и убираем лишние флаги уникальности (если совпадений нет)
for (( i=0; i < $length; i++))
do
    if [ ${b[$i]} != 0 ]
        then
            a2[$i]+="${b[$i]}"
    fi
echo ${a2[$i]}"," >>new_csv3
done
#формируем результирубющий файл и удаляем временные файлы
paste new_csv1 new_csv2 new_csv3 new_csv4 > ./new_csv 
tr -d "\t" < ./new_csv >> ./accounts_new_uname.csv
rm new_csv new_csv1 new_csv2 new_csv3 new_csv4 accounts_1.csv