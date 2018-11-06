#!/bin/bash

exec 3> ./report.txt
for dir in $( ls | egrep "^gr[0-9]{2}[ab]_lab01$" )
do
	team="${dir%_*}"
	if [ -d $dir ]
	then
		cd $dir
		if [ ! -e es02/es02.sh ] 
		then
			status="KO	Missing file es02.sh"
		else
			cd es02
			if [ -e host.txt ]
			then
				if [[ $(diff ../../../host.txt host.txt) ]]
				then
					cp ../../../host.txt ./
				fi
			else
				cp ../../../host.txt ./
			fi
			
			#elimino altri file
			for f in *
			do
				if [ "$f" != "host.txt" -a "$f" != "es02.sh" ]
				then
					rm -rd $f
				fi
			done

			#permesso execute
			chmod +x es02.sh
			#execute
			./es02.sh

			if [ -e hostRenamed.txt ]
			then
				if [[ ! $(diff ../../../hostRenamed.txt hostRenamed.txt) ]]
				then
					status="OK"
				else
					status="KO	Unmatched output (percentuale% correct)"
				fi
			else
				status="KO 	no es02/hostRenamed.txt was generated."
			fi
			cd ../
		fi
	fi
	cd ../
	echo "$team	$status" >&3
done
exec 3<&-
