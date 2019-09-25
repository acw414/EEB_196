#!/bin/bash
#user guide: sh 1_10_3_part1.sh <file name>

rows=$(wc -l $1 | awk '{print $1}')
columnchar=$(head -n 1 $1 | tr -d " ")
columns=$(echo -n $columnchar | wc -c)

echo "Filename:" $1
echo "Number of rows:" $rows
echo "Number of columns:" $columns
