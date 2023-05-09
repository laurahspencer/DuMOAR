# I ran this code interactively on Sedna 
# `srun --pty /bin/bash` # First, I entered an interactive Sedna node
# `module load R` # Then, load R
# `R` #start R interactively 
# Now proceed with the following code 

# Install and load programs

# Load MethylKit
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("methylKit")

require(methylKit)
require(tidyverse)

# Load sample info dataframe 
load(file="/home/lspencer/DuMOAR/R/sample.info")

# Triple check that treatments are in the order of sequence sample number (1-20)
(sample.info %>% arrange(sample_seq))$sample # List out library prep sample number 
(sample.info %>% arrange(sample_seq))$sample_seq # List out sequence sample 
(sample.info %>% arrange(sample_seq))$high_or_low_co2 # List out treatment

# Read .bam files into Methylkit on Sedna 
(file.list=list("/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH01_06_S1_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH01_14_S2_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH01_22_S3_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH01_38_S4_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH03_04_S5_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH03_15_S6_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH03_33_S7_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH05_01_S8_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH05_06_S9_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH05_21_S10_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH05_24_S11_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH07_06_S12_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH07_11_S13_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH07_24_S14_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH09_02_S15_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH09_13_S16_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH09_28_S17_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH10_01_S18_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH10_08_S19_R1_bismark_bt2_pe.deduplicated.sorted.bam",
               "/scratch/lspencer/DuMOAR/aligned/trim-before-concat/CH10_11_S20_R1_bismark_bt2_pe.deduplicated.sorted.bam"))

#### The following command reads sorted BAM files and calls methylation percentage per base, and creates a methylRaw object for CpG methylation. It also assigns minimum coverage of 2x and the treatments (in this case, the CO2 treatment)

meth_obj = processBismarkAln(location = file.list, sample.id = list("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18", "19", "20"), 
                          assembly = "PGA_assembly.scaffolds_only.fasta", read.context="CpG", mincov=2, 
                          treatment = as.numeric((sample.info %>% arrange(sample_seq))$high_or_low_co2))

#### Save the MethylKit object; re-doing the previous step is memory/time intensive, so best to use the saved object moving forward. 

save(meth_obj, file = "/home/lspencer/DuMOAR/R/meth_obj")
