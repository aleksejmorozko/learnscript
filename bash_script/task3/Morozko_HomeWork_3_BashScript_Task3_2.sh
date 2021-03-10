#!/bin/bash

learnYearMonth=(31 28 31 30 31 30 31 31 30 31 30 31)				
case $(date +'%m') in												
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