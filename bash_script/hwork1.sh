#!/bin/bash
echo '----------------------------exercise 1-------------------------------'
date_now=$(date)
echo [$date_now] "Hello, Task2!"

echo '----------------------------exercise 2-------------------------------'
var1='Hello, '
var2='broken'
var3='script'
echo $var1 $var2 $var3

echo '----------------------------exercise 3-------------------------------'
#--Part 1
export MY_VAR=my_value			    #ввод переменной
echo my_var=$my_var			        #вывод при запуске sh-скрипта

#--Part 2
export MY_VAR=my_value			    #ввод переменной
echo $1					            #вывод при запуске sh-скрипта

#--Part 3
export my_var=my_value			    #ввод переменной
sh ./bash_script 			        #команда запуска скрипта выдаст:
my_var=my_value
unset my_var				        #команда сбросит значение переменной и значение будет браться из самого файла
echo my_var=${my_var=default}		#после команды unset будет подставленно значение my_var=default


echo '----------------------------exercise 4-------------------------------'

#--Part 1
mystring='abcdefghijklmn'		    #ввод переменной
echo ${mystring:2:5}			    #вывод со 2 до 5 го символа

#--Part 2
hello="Hello world!"			    #ввод переменной
echo ${hello/Hello/Goodbye}		    #замена по шаблонуодного совпадения. замена Hello на Goodbye

#--Part 3
jesus="water wine water wine water wine"	#ввод переменной
echo ${jesus//water/wine}			#многократная замена по шаблону

#--Part 4
mypath=$(pwd)					    #определение переменной
echo ${mypath}					    #вывод значения на экран
/home/lex/Work/bash_script			#полученное значение
# way 1
echo ${mypath/'lex/Work/bash_script'/devops}	#вариант подастановки вместо известной строки
# way 2
echo ${mypath/*//home/devops}		#вариант подстановки когда первоначальная строка не известна и важен результат
