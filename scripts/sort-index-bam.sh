#!/bin/bash

#SBATCH --job-name=sort-bams
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/sort-bams-20221114.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 20
#SBATCH -t 21-0:0:0

# This script is for sorting bam files then indexing

module load bio/samtools/1.15.1

cd /scratch/lspencer/DuMOAR/aligned/trim-before-concat

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
