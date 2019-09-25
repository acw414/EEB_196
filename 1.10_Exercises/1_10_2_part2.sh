#!/bin/bash
#User guide: sh 1_10_2_part2.sh <file name> <ID of individual> 

command=$(cut -f 1 $1 | grep -w  "$2" | uniq -c | awk '{print $1}')
echo "Individual $2 was sampled $command times"
