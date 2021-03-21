#!/bin/bash
apt install postgresql-12 -y
apt install nginx -y
wget https://repo.zabbix.com/zabbix/5.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.2-1+ubuntu20.04_all.deb
dpkg -i zabbix-release_5.2-1+ubuntu20.04_all.deb
apt update
apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-nginx-conf zabbix-agent -y
sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix 
zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix 
systemctl restart zabbix-server zabbix-agent nginx php7.4-fpm
systemctl enable zabbix-server zabbix-agent nginx php7.4-fpm 
echo 'DBPassword=password' >> /etc/zabbix/zabbix.conf