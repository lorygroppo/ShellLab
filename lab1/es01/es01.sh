case $1 in
	1)
		if (( $#==2 ))
		then
			find ~ -name $2 -type f -print
		else
			echo "ERRORE: numero di parametri errato!"
		fi
		;;
	2)
		if (( $#==3 ))
		then
			name=$2;
			if [ ! -d $3 ]
			then
				mkdir $3
				echo "La cartella non esisteva ed è stata creata"
			fi
			cd $3
			if [ -e $2 ]
			then
				echo ERRORE: il file $2 esiste già
			else
				`touch $2`
			fi
		else
			echo "ERRORE: numero di paramentri errato!"
		fi
		;;

	*)
		echo ERRORE: comando assente
		;;
esac


