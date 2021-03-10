#!/bin/bash

#-- in one line 
ls -l | awk 'NR > 1 { print "filename: " $9 ", owner: " $3}'    #решение данной задачи без использования цикла
#----------------------------------------------------------------------------

ls -l | awk 'NR > 1 {print }' > /tmp/test                           #для решения данной задачи создаем временный файл, в который вносим список файлов

while read LINE;                                                    #функция определения файл - владелец
do
    echo "$LINE" | awk $'{print "filename: " $9 ", owner: " $3}'
done < /tmp/test
rm /tmp/test   