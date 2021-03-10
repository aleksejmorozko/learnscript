#!/bin/bash
# you’re given a variable with some path. Get parent path using string manipulating

mypath=$(pwd)					    #определение переменной
echo ${mypath}					    #вывод значения на экран
/home/lex/Work/bash_script			#полученное значение
# way 1
echo ${mypath/'lex/Work/bash_script/task2'/devops}	#вариант подастановки вместо известной строки
# way 2
echo ${mypath/*//home/devops}