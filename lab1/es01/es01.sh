case $1 in
	1)
		ciaone
	2)
		scemo
	3)
		if (( $#==4 ))
		then
			if [ -d $3 ]
			then
				if [ -d $4 ]
				then
					mv $3/$2 $4
				else
					echo " cartella non esistente, creare la cartella? (Y/n)"
					read risp
					if(( $risp=="Y" ))
					then
						mkdir $4
						mv $3/$2 $4
					fi		 
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
