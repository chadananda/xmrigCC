#!/bin/bash

MAX_HASH_RATE=0
MAX_HASH_RATE_UNITS=0
TEMP1=0
TEMP2=0
I=output.txt

while read LINE; do
	if [[ $LINE =~ "miner" && $LINE =~ "speed" && $LINE =~ "max" ]]
	then
		MY_ARRAY=($LINE)

		TEMP1=$(( ${#MY_ARRAY[@]} - 2 ))
		TEMP2=$(( ${#MY_ARRAY[@]} - 1 ))

		TEMP1=${MY_ARRAY[$TEMP1]}
		TEMP2=${MY_ARRAY[$TEMP2]}
		if [[ $TEMP1 =~ "n/a" ]]
		then
			TEMP1=0
		fi

		if [ $TEMP1 > $MAX_HASH_RATE ]
		then
			MAX_HASH_RATE=$TEMP1
			MAX_HASH_RATE_UNITS=$TEMP2
		fi
	fi
done < "$I"
echo $MAX_HASH_RATE $MAX_HASH_RATE_UNITS

