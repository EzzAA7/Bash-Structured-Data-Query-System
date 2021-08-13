#!/bin/bash

declare -a arr

cut -d' ' -f1- > hi1.$$

head -1 hi1.$$ > hp.$$ 

echo "hi" >>  hp.$$

columns="$(head -1 hp.$$  | sed 's/[^ ]//g' | wc -c)"

rows="$(cat hi1.$$ | wc -l)"  # rows !



i=1

while [ $i -lt $(("${columns}" + 1))  ]

do
	arr[$i]="$(head -1 hp.$$  | cut -d' ' -f$i)"
	i=$(($i + 1))
done




if [ $# -ne 3 ]
then
	echo -e "\e[1;31mWRONG : You must write like this : \e[0m"
	echo "Where.sh 'columnName' 'operation' 'value'"	

else
	i=1
	j=2
	head -1 hi1.$$
	while [ $i -lt $(("${columns}" + 1))  ]
	do
		if [ "$1" = "${arr[$i]}" ]
		then
			if [ "$2" = "=" ]
			then
				while [ "$j" -le "${rows}" ]
				do
					if [ "$3" = "$(sed -n ""$j"p" hi1.$$ | cut -d' ' -f$i)" ] 
					then
						
						sed -n ""$j"p" hi1.$$
								
					fi
					
					j=$(($j + 1))
				done
					

			elif [ "$2" = ">" ] 
			then
				while [ "$j" -le "${rows}" ]
				do
					if [ "$3" -lt "$(sed -n ""$j"p" hi1.$$ | cut -d' ' -f$i)" ] 
					then
						
						sed -n ""$j"p" hi1.$$
									
					fi
					
					j=$(($j + 1))
				done

			elif [ "$2" = "<" ] 
			then
				while [ "$j" -le "${rows}" ]
				do
					if [ "$3" -gt "$(sed -n ""$j"p" hi1.$$ | cut -d' ' -f$i)" ] 
					then
						
						sed -n ""$j"p" hi1.$$
								
					fi
					
					j=$(($j + 1))
				done

			else 
				echo "Not Supportd !!!"

			fi	
		fi
		i=$(($i + 1))
	done	 
		
	
fi



rm hi1.$$ hp.$$


