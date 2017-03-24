#!/bin/bash
sed -i '/local7.*/alocal2.debug    /var/log/sudo.log' /etc/rsyslog.conf
sed -i '/secure_path/aDefaults logfile=/var/log/sudo.log \nDefaults loglinelen=0 \nDefaults !syslog' /etc/sudoers
systemctl restart rsyslog
sudo getenforce
[ -f /var/log/sudo.log ] && echo "sudo log  ok " || echo "sudo log fail"
