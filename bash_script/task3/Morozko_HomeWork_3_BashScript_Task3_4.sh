#!/bin/bash

cat /etc/shadow &>/dev/null											
if [ $? -eq 0 ]
	then
		echo "can touch files"
	else 
		echo "files can't touch"
fi