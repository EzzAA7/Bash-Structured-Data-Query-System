#!/bin/bash

declare -a arr

cut -d' ' -f1- > hi1.$$
head -1 hi1.$$ > hp 
echo "hi" >>  hp
columns="$(head -1 hp  | sed 's/[^ ]//g' | wc -c)"


i=1

while [ $i -lt $(("${columns}" + 1))  ]

do
	arr[$i]="$(head -1 hp  | cut -d' ' -f$i)"
	i=$(($i + 1))
done


if [ "$#" -ne 1 -a "$#" -ne 2 ]
then
			
	echo -e "\e[1;31mWRONG : You must write like this : \e[0m"
	echo "[Order_by 'columnName'] OR [Order_by 'columnName' '[ASC OR DESC]']"
else
	i=1
	j=2
	
	while [ $i -lt $(("${columns}" + 1))  ]
	do
		if [ "$1" = "${arr[$i]}" ]
		then

           		 if [ "$#" -eq 1 ]
			then
#head to get first line
#tail to get all lines starting from 2nd line
#Pipes tail output with sort
#Merages head output with (tail+sort) using &&				
              			head -n 1 hi1.$$ && tail -n +2 hi1.$$| sort -t' ' -k"$i"  
					
			elif [ "$#" -eq 2 ] 
           		then

               			if [ "$2" = "Asc" -o "$2" = "ascending" ]
			    	then
                    			head -n 1 hi1.$$ && tail -n +2 hi1.$$| sort -t' ' -k"$i"

                		elif  [ "$2" = "Desc" -o "$2" = "descending" ]
                		then
                      			head -n 1 hi1.$$ && tail -n +2 hi1.$$| sort -t' ' -k"$i" -r

				fi	
		    
			fi
       		fi
		i=$(($i + 1))
	done	 
		
	
fi

rm hi1.$$ hp


