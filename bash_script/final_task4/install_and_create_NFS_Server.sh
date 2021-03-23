#!/bin/bash

apt install nfs-kernel-server -y
systemctl enable nfs-server
mkdir /var/nfs
echo '/var/nfs 192.168.100.0/24(rw,sync,no_root_squash)' >> /etc/exports
chmod 777 /var/nfs
exportfs -a
ufw allow 111
ufw allow 2049
