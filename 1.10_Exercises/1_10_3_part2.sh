#!/bin/bash
#user guide: sh 1_10_3_part2.sh

for file in  ~/CSB/unix/data/Saavedra2013/*.txt; do
	rows=$(wc -l $file | awk '{print $1}')
	columnchar=$(head -n 1 $file | tr -d " ")
	columns=$(echo -n $columnchar | wc -c)
	echo "Filename:" $file
	echo "Number of rows:" $rows
	echo "Number of columns:" $columns
done

