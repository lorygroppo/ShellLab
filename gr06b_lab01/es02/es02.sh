exec 3<host.txt
exec 4>hostRenamed.txt
while read LINE <&3
do
	m=$( echo "$LINE" | cut -d ')' -f 1 )
	parte 1
	n=$(( $m+30 ))
	ip="192.168.1.$n"
	dominio=$(echo "$LINE" | cut -d ' ' -f 3 )
	host="host$m"
	dominio="$host.${dominio#*.}"
	echo "$ip $dominio $host" >&4
	parte 2
done
