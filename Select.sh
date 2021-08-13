#!/bin/bash



declare -a arr

cut -d' ' -f1- > hi1

head -1 hi1 > hp 

echo "hi" >>  hp

columns="$(head -1 hp  | sed 's/[^ ]//g' | wc -c)"


i=1

while [ $i -lt $(("${columns}" + 1))  ]

do

	arr[$i]="$(head -1 hp  | cut -d' ' -f$i)"
	i=$(($i + 1))

done


rm hp    #close the file !!


ine=0
thereIs=0
touch h3
touch h2
touch h4
if [ "$#" -ne 0 ]
then

	while [ "$#" -ne 0 ]
	do
		i=1
		while [ $i -lt $(("${columns}" + 1))  ]

		do
			if [ "$1" = "${arr[$i]}" ]
			then
				thereIs=1
				if [ "$ine" -eq 0 ] #first time in
				then
					cut -d' ' -f$i hi1  > h3
					ine=1
				else
					cut -d' ' -f$i hi1  > h2
					paste h3 h2 > h4
					cat h4 > h3
					
				fi	
			fi
			
			i=$(($i + 1))
		done	

	shift

	done
	
	if [ $thereIs -eq 1 ]
	then
		cat h3
	else
		
		echo -e "\e[1;31mThere is no column/s with this name/s \e[0m"
	fi

else
	echo -e "\e[1;31mWRONG : You must write like this : \e[0m"
	echo "Select.sh [list of columns]"

fi




rm h2 h3 h4 hi1 # Close Files







