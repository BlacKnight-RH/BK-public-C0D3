#!/bin/bash 

if [ "$1" == "" ]

then
	echo "Usag ./online_ip.sh network-ip"
	echo "example: ./online_ip.sh 192.168.1"

else 
	 
	for x in `seq 1 255` ; do
		ping -c 1 $1.$x | grep "64 bytes" | cut -d " " -f 4 | sed 's/://'

done
fi 
