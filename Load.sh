#!/bin/sh



if [ "$#" -eq 2 ]
then 
	echo ' '
	echo -e "\e[1;31mWRONG : You must write like this : \e[0m"
	echo "load.sh -d delimiter file_name"
	exit 1
	break
	sleep 5
	
elif [ "$#" -eq 3 ]
then
	if [ "$1" = "-d" ]

	then

		if [ -e $3 ]
		then
			if [ -s $3 ]
			then
                		cut -d "$2" -f1- "$3" | tr "$2" ' '
			else
				echo ' '
              	 		echo -e "\e[1;31mfile Empty\e[0m"
               		 	exit 1
			fi
		else
				echo ' '
               	echo -e "\e[1;31mfile not found\e[0m"
                exit 1
		fi
	else 

		echo ' '
		echo -e "\e[1;31mWRONG: You Must write "-d" ! \e[0m"
		exit 1
		
	fi
#--------------------------------------------------------------------
#if one arg is it file 
    #file is gonna be the $1 and no delim so IFS=,


elif [ "$#" -eq 1 ]
then
	if [ ! -e $1 ]
	then
				if [ "$1" = "-d" ]
					then 
					echo ' '
					echo -e "\e[1;31m-d cannot be a file \e[0m"
					exit 

				else
				echo ' '
                echo -e "\e[1;31mfile doesnt exist \e[0m"
                exit 99
				sleep 10

				fi
            
        else
			if [ -s $1 ]
			then
                		cut -d , -f1- "$1" | tr ',' ' '
			else
				echo ' '
              	 		echo -e "\e[1;31mfile Empty\e[0m"
               		 	exit 1
			fi
			
				
	fi

#_________________________________________________________________
else 
	echo -e "\e[1;31mWrong number of parameters\e[0m" 
fi


