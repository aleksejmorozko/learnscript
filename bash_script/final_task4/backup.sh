#!/bin/bash

echo 'tar -cvzpf /mnt/$(date '+%d-%m-%Y-%H:%M:%S').tar.gz /root /home' > /etc/cron.daily/backup_files
chmod 777 /etc/cron.daily/backup_files