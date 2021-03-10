#!/bin/bash
# Develop a script that prints information about the current month. 
# he script should print the number of days of the current month.
learnYearMonth=(31 28 31 30 31 30 31 31 30 31 30 31)
echo ${learnYearMonth[$(date +'%m') - 1]}