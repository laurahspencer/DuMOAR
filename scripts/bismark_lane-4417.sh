#!/bin/bash

#SBATCH --job-name=bismark-mbd
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/bismark-lane-4417-20221121.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 20
#SBATCH -t 21-0:0:0

# DuMOAR Project
# This script is for aligning trimmed MBD-BS data to Dungeness crab genome via bismark
#     and making methylation calls.
# Data was generated from Dungeness crab exposed to two pH conditions during early life.

#source /home/lspencer/venv/bin/activate
module load bio/bismark/0.24.0
source /home/lspencer/venv/bin/activate
module load bio/samtools/1.15.1

IN="/scratch/lspencer/DuMOAR/trimmed/before-concat/4417/"
OUT="/scratch/lspencer/DuMOAR/aligned/lanes-separately/4417/"

# # Prepare genome for Bismark
# # NOTE: for some reason using a path variable to specify genome folder didn't work
# # Also- this only needs to be run once
# bismark_genome_preparation \
# --verbose \
# --parallel 20 \
# --bowtie2 \
# /home/lspencer/references/dungeness/

# Run Bismark to align trimmed reads

# Move to where bismark files will be written
cd ${OUT}

# NOTE: bismark guide recommends only 4 cores

find ${IN}*_L001_R1_001_val_1.fq.gz \
| xargs basename -s _L001_R1_001_val_1.fq.gz | xargs -I{} bismark \
--bowtie2 \
-genome /home/lspencer/references/dungeness/ \
-p 4 \
-score_min L,0,-0.6 \
--non_directional \
-1 ${IN}{}_L001_R1_001_val_1.fq.gz \
-2 ${IN}{}_L001_R2_001_val_2.fq.gz \
--output_dir ${OUT}

# Deduplicate, call methylation status, extract methylation and create downstream amendable files.

find *.bam | \
xargs basename -s .bam | \
xargs -I{} deduplicate_bismark \
--bam \
--paired \
{}.bam

bismark_methylation_extractor \
--bedGraph --counts --scaffolds \
--multicore 20 \
--buffer_size 75% \
*deduplicated.bam

# Bismark processing report
bismark2report

#Bismark summary report
bismark2summary

# Run multiqc to summarize bismark reports
multiqc . .

# Sort .bam files by coordinate - for MethylKit
find *deduplicated.bam | \
xargs basename -s .bam | \
xargs -I{} samtools \
sort {}.bam \
-o {}.sorted.bam

# Index sorted files for IGV
# The "-@ 20" below specifies number of CPU threads to use.

find *.sorted.bam | \
xargs basename -s .sorted.bam | \
xargs -I{} samtools \
index -@ 20 {}.sorted.bam
