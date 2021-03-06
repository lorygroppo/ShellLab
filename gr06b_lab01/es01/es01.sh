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
	3)
		if (( $#==4 ))
		then
			if [ -d $3 ]
			then
				if [ -e $3/$2 ]
				then
					if [ -d $4 ]
					then
						mv $3/$2 $4
					else
						risp="test"
						until [ $risp = "n" -o $risp = "Y" ]
							do
							echo "cartella non esistente, creare la cartella? (Y/n)"
							read risp
								if [ $risp = "Y" ]
							then
								mkdir $4
								mv $3/$2 $4
							fi
						done
					fi
				else
					echo file $2 non esiste
				fi
			else
				echo "cartella sorgente inesistente"
			fi 
		else
			echo "numero di parametri errato"
		fi
	;;
	4)
		if(( $#==2))
		then
			rm $2
		else
			echo "numero di parametri errato"
		fi
	;;
	5)
		if(( $#==2))
		then
			rm -r $2
		else
			echo "numero di parametri errato"
		fi
	;;
	*)
		echo "comando errato o assente"
	;;
esac
