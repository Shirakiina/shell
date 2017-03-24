#!/bin/bash
read -p "username: " username
useradd -m -s /bin/bash $username
echo $username | passwd $username --stdin
chage -d 0 $username
read -p "does it sudoers? y/n " sudoer
[ $sudoer =  y ] && sed -i "/anywhere/a$username ALL=(ALL)       NOPASSWD:ALL" /etc/sudoers
