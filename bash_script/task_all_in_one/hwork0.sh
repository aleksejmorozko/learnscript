#!/bin/bash
echo '----------------------------TASK 1-------------------------------'
echo "Hello world"

echo '----------------------------TASK 2-------------------------------'
echo '----------------------------EX 1-------------------------------'
echo "Hello world"

echo '----------------------------TASK 2-------------------------------'
echo '----------------------------EX 2-------------------------------'
echo "Hello World!"

echo '----------------------------TASK 2-------------------------------'
echo '----------------------------EX 3-------------------------------'
# Надо доюавить права доступа на файл  Chmod 777 ./hello world или chmod +rwx ./hello.sh

echo '----------------------------TASK 3-------------------------------'
echo '----------------------------EX 1-------------------------------'
echo 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.' > lorem
cat ./lorem  | grep dolore

echo '----------------------------TASK 3-------------------------------'
echo '----------------------------EX 2-------------------------------'
echo '1: mclaren-720s/silver

2: Porsche-911/gray

3: Vaz-2109/cherry' > parking_info
cat parking_info | cut -d' ' -f2 | cut -d/ -f1 | cut -d- -f1


cat parking_info | cut -d' ' -f2 | cut -d/ -f1 | cut -d- -f1


echo '----------------------------TASK 3-------------------------------'
echo '----------------------------EX 3-------------------------------'
echo 'CentOS is a Linux distribution that provides a free, community-supported computing platform functionally compatible with its upstream source, Red Hat Enterprise Linux (RHEL).

GNU xterm or simply Bash is a Unix shell and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell.

Linux is a family of open source Unix-like operating systems based on the Linux kernel.' > sed_task

sed -i '/Linux/d' sed_task

echo '----------------------------TASK 3-------------------------------'
echo '----------------------------EX 4-------------------------------'
cat /etc/passwd | awk -F":" '{ print $6 }' | awk -F"/" '{ print $NF }'


echo '----------------------------TASK $-------------------------------'
echo '----------------------------EX 1-------------------------------'
echo Home dir:  $HOME
echo User Name: $(whoami)
echo User ID: $UID
echo Group Information: $GROUPS
echo Terminal: $TERM 
echo Current directory: $(pwd)
echo System date/time: $(date)