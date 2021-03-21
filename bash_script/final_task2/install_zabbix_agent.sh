#!/bin/bash
get https://repo.zabbix.com/zabbix/5.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.2-1+ubuntu20.04_all.deb
dpkg -i zabbix-release_5.2-1+ubuntu20.04_all.deb -y
apt update -y
apt-get install zabbix-agent -y
cp ./zabbix_agentd.conf /etc/zabbix/
service zabbix-agent start
