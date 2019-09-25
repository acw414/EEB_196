#!/bin/bash
#user guide: sh 1_10_2_part3.sh

firstcolumn=$(cut -f 1 Gesquiere2011_data.csv | tail -n +2 | sort -n -u )
for i in $firstcolumn; do
	command=$(cut -f 1 Gesquiere2011_data.csv | grep -w "$i" | uniq -c | awk '{print $1}')
	echo "Individual $i was sampled $command times"
done



