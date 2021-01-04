#!/bin/bash
# cat accounts.csv | awk -F, ' NF=8 {print $7}' 
# awk -F",|\".*,.*\"," ' {print $1 $2 $3 $4 $5 $6 $7 $8} ' accounts.csv 

# awk -F"[^,]*,| *\"[^\"]*\" *," ' {print $1} ' accounts.csv 

cat accounts.csv | awk '
{
   $0=$0",";  
   while($0) {
     		# определяем начало и конец подстроки с ячейкой, ограниченной ; или "";
     match($0,/[^,]*,| *"[^"]*" *,/);
     		# заносим ячейку в переменные F и SF
     sf=f=substr($0,RSTART,RLENGTH); 


     print "Field " ++c " is " f;
     		# удаляем из обрабатываемой строки обработанную подстроку SF с экранированными спец. символами
     sub(sf,"");
   }
}'