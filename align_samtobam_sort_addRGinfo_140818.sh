#!/bin/bash
#Use highmem te reserve a whole node

#$ -l highp,h_rt=18:00:00,h_data=4G
#$ -pe shared 20
#$ -N SSJ_BWA
#$ -cwd
#$ -m bea
#$ -o /u/flashscratch/a/acw414/SSJ/log/SSJ_BWA.out
#$ -e /u/flashscratch/a/acw414/SSJ/log/SSJ_BWA.err
#$ -M acw414


# load paths and programs
export SEQ=~/project-rwayne/step1/data
export BAM=/u/scratch/a/acw414
export REF=~/project-rwayne/step1/canfam31/canfam31.fa
export PICARD=/u/local/apps/picard-tools/current

echo "done exportng paths"

# load your modules:
. /u/local/Modules/default/init/modules.sh
module load bwa
module load picard_tools
module load java/1.8.0_111
module load bowtie2

echo "loaded modules"

## _bwamem.sam
## _bwamem_sortRG.bam

align_fn () {
	echo "***** Beginning alignment of $1 *****"
	
	##If you want to aling with Botiew2
	##bowtie2 -q --phred33 -p12 --very-sensitive-local -X 3200 -x ${REF} \
	##-1 ${SEQ}/${1}*val_1.fq.gz -2 ${SEQ}/${1}*val_2.fq.gz -S ${BAM}/${1}_bwt2_3200.sam

	#If you	want to	aling with BWA
	bwa mem -M -t 20 ${REF} \
	${SEQ}/${1}val_1.fq.gz \
	${SEQ}/${1}val_2.fq.gz > ${BAM}/${1}_bwamem.sam
	
	echo "***** Alignment of $1 complete *****"
		
#	echo "***** Beginning sam to bam conversion *****"
#	echo "***** Sample = $1, Lane = $2, Library = $3 RGSM = $4 *****"
	
#	java -jar -Xmx8g -Djava.io.tmpdir=${BAM}/temp ${PICARD} AddOrReplaceReadGroups \
#	INPUT=${BAM}/${1}_bwamem.sam   \
#	OUTPUT=${BAM}/${1}_bwamem_sortRG.bam \
#	SORT_ORDER=coordinate \
#	RGID=HF2BBJ10may19${2} \
#	RGLB=$3 \
#	RGPL=ILLUMINA \
#	RGPU=HF2BBJ10may19 \
#	RGSM=${4} \
#	RGCN=UCB \
#	VALIDATION_STRINGENCY=LENIENT \
#	TMP_DIR=${BAM}/temp
#	
#	echo "***** Sam to bam conversion complete *****"
	
	echo "***** $1 processing complete *****"
}

align_fn Bush-dog_R0902_1_1_
