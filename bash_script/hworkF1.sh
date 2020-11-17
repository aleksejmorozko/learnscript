#!/bin/bash
#filename=$@
#cat ./accounts.csv | awk 'NR < 2' > accounts_new.csv

#grep -i '' accounts.csv
#awk '{print $2}' accounts.csv

#awk -F"[, ]" ' { print $1","$2","$3","$4","(toupper(substr($5,1,1)) substr($5,2)) \
# " " (toupper(substr($6,1,1)) substr($6,2))","$7"," tolower(substr($5,1,1)) tolower(substr($6,2)) "@abc" } ' accounts.csv > accounts_new1.csv

#awk -F"[, ]" ' { print $1","$2","$3","$4","(toupper(substr($5,1,1)) substr($5,2)) \
# " " (toupper(substr($6,1,1)) substr($6,2))} ' accounts.csv > accounts_name.csv

awk -F"[,]" ' { sed '/,\n/' print tolower(substr($5,1,1)) tolower(substr($6,2)) "@abc" }' accounts.csv > email.csv
#