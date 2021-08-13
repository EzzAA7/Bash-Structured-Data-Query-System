#!/bin/sh

if [ "$#" -eq 0 ]
then
	sed -n "1,2p"		
elif [ "$#" -eq 1 ]
then
	number=$(($1 + 1))
	sed -n "1,"$number"p"
else
	echo -e "\e[1;31mWRONG : You must write like this : \e[0m"
	echo "[Limit.sh n] OR [Limit.sh]"
fi
