#!/bin/bash


cut -d' ' -f1- > hi1.$$

if [ "$#" -eq 3 ]
then
    file=$3
    if [ ! -e $file ]
        then

        touch $file
        fi
    
    if [ "$1" = "-d" ]

	    then

        	cat hi1.$$ | tr ' ' "$2" | tr '		' "$2" > $file
       
		echo " "
		echo -e "\e[1;34mThe Data Is Now Stored in $file \e[0m"
            	

	    else 

		    echo "You Must write "-d" !!"
	    		
        fi
         
else

    echo -e "\e[1;31mWRONG --> You must write like this :   store.sh -d delimiter file_name\e[0m"
    

fi

rm hi1.$$
