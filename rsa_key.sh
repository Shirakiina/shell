#!/bin/bash
#########################
#Put rsa key file in rsa.txt 
#Then out result.rsa
##########################
mkdir ./rsa
a=1
while read myline
do
echo $myline > ./rsa/$a.rsa
ssh-keygen -lf ./rsa/$a.rsa >> ./result.rsa
rm ./rsa/$a.rsa
a=$(($a+1))
done < rsa.txt
rm -fr ./rsa
