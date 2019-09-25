Exercise 1.10.1
1)
  999  git clone https://github.com/CSB-book/CSB.git
 1000  ls
 1001  cd CSB
 1002  ls
 1003  cd unix/data/
 1004  ls
 1005  cd ../sandbox/
2)
 1008  ls -lh ../data/Marra2014_data.fasta 
	size = 553K
3)
 1009  cp ../data/Marra2014_data.fasta .
 1010  mv Marra2014_data.fasta my_file.fasta
4)
 1012  grep -c isogroup00036 my_file.fasta 
	16 contigs
5)
 1019  cat my_file.fasta | tr -s "  " | tr  " " ","  > new_my_file.fasta
6)
 1029  grep isogroup* new_my_file.fasta | cut -d ',' -f 4 | uniq
	43 unique isogroups
7)
 1047  grep numreads* new_my_file.fasta | tr -d "numreads=" | sort -t$',' -k3 -n
	contig00302 has the highest number, it has 3330 reads

Exercise 1.10.2
1) 
cut -f 1 Gesquiere2011_data.csv | grep -w  "3\|27" | uniq -c
     61 3
      5 27
	61 records for individual 3, 5 records for invididual 27
2)
written in script 1_10_2_part2.sh:
______
#!/bin/bash
#user guide: sh 1_10_2_part2.sh <file name> <ID of individual>

command=$(cut -f 1 $1 | grep -w  "$2" | uniq -c | awk '{print $1}')
echo "Individual $2 was sampled $command times"
_______
3)
written in script 1_10_2_part3.sh:
______
#!/bin/bash
#user guide: sh 1_10_2_part3.sh

firstcolumn=$(cut -f 1 Gesquiere2011_data.csv | tail -n +2 | sort -n -u )
for i in $firstcolumn; do
        command=$(cut -f 1 Gesquiere2011_data.csv | grep -w "$i" | uniq -c | awk '{print $1}')
        echo "Individual $i was sampled $command times"
done
______
Exercise 1.10.3
1)
written in script 1_10_3_part1.sh
______
#!/bin/bash
#user guide: sh 1_10_3_part1.sh <file name>

rows=$(wc -l $1 | awk '{print $1}')
columnchar=$(head -n 1 $1 | tr -d " ")
columns=$(echo -n $columnchar | wc -c)

echo "Filename:" $1
echo "Number of rows:" $rows
echo "Number of columns:" $columns
_______
2)
written in script 1_10_3_part2.sh
______
#!/bin/bash
#user guide: sh 1_10_3_part2.sh

for file in ~/CSB/unix/data/Saavedra2013/*.txt; do
        rows=$(wc -l $file | awk '{print $1}')
        columnchar=$(head -n 1 $file | tr -d " ")
        columns=$(echo -n $columnchar | wc -c)
        echo "Filename:" $file
        echo "Number of rows:" $rows
        echo "Number of columns:" $columns
done
______

