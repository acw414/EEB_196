#!/bin/bash

#run using sh name.sh to try it (see if it works)
#then afer run using qsub name.sh

# Use highmem te reserve a whole node
#$ -l highp,h_rt=32:00:00,h_data=5G
#$ -N BushDog_IluTrim
#$ -cwd
#$ -m bea
#$ -o /u/flashscratch/a/acw414/SSJ/log/SSJ_IlumTrim.out
#$ -e /u/flashscratch/a/acw414/SSJ/log/SSJ_IlumTrim.err
#$ -M acw414

# load your modules:
. /u/local/Modules/default/init/modules.sh
module load samtools/1.2

echo 'modules loaded' 

# load paths and programs
export input=/u/home/a/acw414/project-rwayne/step1/data
export illumina=/u/home/a/acw414/project-rwayne/step1/programs/fastq_illumina_filter-0.1/fastq_illumina_filter
export Trimgalore=/u/home/a/acw414/project-rwayne/step1/programs/TrimGalore/trim_galore
export cutadapt=/u/home/a/acw414/project-rwayne/step1/programs/cutadapt-1.8.1/bin/cutadapt

echo 'paths loaded' 

# load reads
 
export file1=Bush-dog_R0902_1_1
export file2=Bush-dog_R0902_1_2

echo 'reads loaded'

gunzip -c ${input}/${file1}.fastq.gz | ${illumina} -Nv | gzip > ${input}/${file1}_FILTERED.gz
gunzip -c ${input}/${file2}.fastq.gz | ${illumina} -Nv | gzip > ${input}/${file2}_FILTERED.gz

echo '######################'
echo 'TrimAdapters'
echo '######################'

cd ${input}
${Trimgalore} --path_to_cutadapt ${cutadapt} -q 20 --fastqc -a AGATCGGAAGAGC --length 20 --paired ${file1}.fastq.gz ${file2}.fastq.gz
