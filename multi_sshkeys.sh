#!/bin/bash
#IP IN iii.txt
#PASSWD IN passwd 
username=hahaha 
file=./iii.txt

for i in `cat $file`
do
sshpass -f ./passwd ssh-copy-id -i /home/xxx/.ssh/id_rsa.pub $username@$i
done

