#!/bin/bash

read -p "Insert a word [end to terminate]: " -r word
while [ $word != "end" ]
do
		reverse=""	
		for (( i=${#word}-1 ; i>=0 ; i-- ))
		do
			reverse="$reverse${word:$i:1}"
		done
		echo "The reversed word is: $reverse"
		if [ "$word" = "$reverse" ]
		then
			echo "This word is palindrome"
		else
			echo "The word \"$word\" is not palindrome"
		fi
		read -p "Inserire stringa : " -r word
done
echo "End of program."
