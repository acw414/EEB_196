#!/bin/bash
#run codeml for genes in directory, go through the outputs + make a table of modelA + modelAnull values >> output file
for dir in ~/project-rwayne/GeneDirectories1/*/; do #for each gene subdirectory in the overall directory 
	echo "${dir%/}" | sed 's@.*/@@' >> tempvalues.txt #adds the gene name to the temp file
	echo "ModelA =" >> tempvalues.txt #adds the line saying that this part will be for ModelA
#	( cd "$dir"/modelA/Omega1 ; ~/paml-openmp/codeml ) > modelArunlog.txt #runs codeml for each gene - having some issues with this line
	( cd "$dir"/modelA/Omega1 ; awk '/lnL/ {print $5}' out ) >> tempvalues.txt  #go into modelA/Omega1/out, extract the likelihood
	echo "ModelAnull =" >> tempvalues.txt #repeats the same steps for modelAnull
#	( cd "$dir"/modelAnull/Omega1 ; ~/paml-openmp/codeml ) > modelAnullrunlog.txt
	( cd "$dir"/modelAnull/Omega1 ; awk '/lnL/ {print $5}' out ) >> tempvalues.txt
done

echo -e "Gene" '\t\t\t' > tempnames.txt
echo -e '\t' "ModelA" > tempA.txt
echo -e '\t' "ModelAnull"  > tempAnull.txt

grep -B 1 'ModelA =' tempvalues.txt | grep -v 'ModelA =' | grep -vP '\-\-' >> tempnames.txt
grep -A 1 'ModelA =' tempvalues.txt | grep -v 'ModelA =' | grep -vP '\-\-' >> tempA.txt
grep -A 1 'ModelAnull =' tempvalues.txt | grep -v 'ModelAnull =' | grep -vP '\-\-' >> tempAnull.txt

paste tempnames.txt tempA.txt tempAnull.txt > outputtable.txt

rm temp*
