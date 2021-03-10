#!/bin/bash

# Develop a script called 03-which-daemon.sh that checks if the httpd and init daemons
# are running on your system. If an httpd is running, the script should print a message 
# like, "This machine is running a web server." Use ps to check on processes

for t in $(ps -ef | grep cups | awk $'{print $8}')					
do																	
if grep -q 'cupsd' <<< "$t"; then 
	echo "Сервис cups работает"
fi
done