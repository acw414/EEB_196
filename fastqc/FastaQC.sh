#!/bin/bash

#Use highmem te reserve a whole node

#$ -l highp,h_rt=22:00:00,h_data=7G
#$ -N FASTAQC_SSJ
#$ -cwd
#$ -m bea
#$ -o /u/flashscratch/a/acw414/SSJ/log/FASTAQC_SSJ.out
#$ -e /u/flashscratch/a/acw414/SSJ/log/FASTAQC_SSJ.err
#$ -M acw414

# then load your modules:
. /u/local/Modules/default/init/modules.sh
module load java

export RAW_read=/u/home/a/acw414/project-rwayne/step1/data
export FASTAQC=/u/home/a/acw414/project-rwayne/step1/programs/FastQC

echo "########"
echo "Fasta_quality_check"
echo "#######"


FastaQC_fn () {
	echo "***** Beginning FastaqC of $1 *****"

 	${FASTAQC}/fastqc ${RAW_read}/${1}_1_val_1.fq.gz 
	${FASTAQC}/fastqc ${RAW_read}/${1}_2_val_2.fq.gz 

        echo "***** $1 processing complete *****"
}

FastaQC_fn Bush-dog_R0902_1

#FastaQC_fn CL100060195_L02_S2
#FastaQC_fn CHE_611_BJJ_1_USPD16084148_HHHLFCCXY_L3
#FastaQC_fn CHE_611_BJJ_2_USPD16084149_HHHLFCCXY_L2
#FastaQC_fn CHE_611_BJJ_2_USPD16084149_HHHLFCCXY_L3

##FastaQC_fn Bush_dog_6772_3kb
##FastaQC_fn Bush-dog_R0902_1
##FastaQC_fn Bush-dog_R0902_2
##FastaQC_fn Bush_dog_6772_3kb
##FastaQC_fn Maned_wolf_01_3kb
##FastaQC_fn Maned-wolf_01_Flint-1
##FastaQC_fn Maned-wolf_01_Flint-2
##FastaQC_fn Maned_wolf-FLINT
