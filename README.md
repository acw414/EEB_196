## Fall 2019 - EEB 196 Research Apprenticeship in Ecology and Evolutionary Biology
### Anna Weir & Daniel Chavez

#### Week 1   
- (cont. from summer 2019)   
- [codeml script](https://github.com/acw414/EEB_196/blob/master/codeml_gene_script.sh) - run codeml on Tree_Dir fasta files, sort to find modelA / modelAnull values, output to table   
  
#### Week 2  
- Intro to Hoffman2  
- Intro to Comparative Genomics  
- Set up GitHub  
  
#### Week 3  
- [1.10_Exercises](https://github.com/acw414/EEB_196/tree/master/1.10_Exercises) from  *Computing Skills for Biologists: A Toolbox* by Stefano Allesina & Madlen Wilmes (2019)   

#### Week 4  
- Intro to [NGS_Pipeline](https://github.com/dechavezv/NGS_pipeline)   
- conda environment troubleshooting  
  
#### Week 5  
- NGS_Pipeline troubleshooting  
  
#### Week 6  
- creation of [/step_1/filter_illumina.sh](https://github.com/acw414/EEB_196/tree/master/step_1) 
- running [/step_1/filter_illumina.sh](https://github.com/acw414/EEB_196/tree/master/step_1) on Bush-dog_R0902_1  
  
#### Week 7  
- Analysis of filter_illumina trimming reports  
- creation of [/fastqc/FastaQC.sh](https://github.com/acw414/EEB_196/tree/master/fastqc) 
- running [/fastqc/FastaQC.sh](https://github.com/acw414/EEB_196/tree/master/fastqc) on Bush-dog_R0902_1  
  
#### Week 8  
- Analysis of fastqc reports  
- creation of [align_samtobam_sort_addRGinfo_140818.sh](https://github.com/acw414/EEB_196/blob/master/align_samtobam_sort_addRGinfo_140818.sh) 
- running [align_samtobam_sort_addRGinfo_140818.sh](https://github.com/acw414/EEB_196/blob/master/align_samtobam_sort_addRGinfo_140818.sh) on Bush-dog_R0902_1 
  
#### Week 9  
- troubleshooting with [align_samtobam_sort_addRGinfo_140818.sh](https://github.com/acw414/EEB_196/blob/master/align_samtobam_sort_addRGinfo_140818.sh)  
  - Hoffman space issues
  - Resolved by changing memory requested
  - script outputs an empty file  
  - fixed with modifying inputs 

#### Week 10 + Finals
- troubleshooting with [align_samtobam_sort_addRGinfo_140818.sh](https://github.com/acw414/EEB_196/blob/master/align_samtobam_sort_addRGinfo_140818.sh)  
  - script outputs an empty file
  - resolved by renaming multiple Bush-dog_R0902_1 inputs >> Bush-dog_R0902
  - Hoffman space issues again   
