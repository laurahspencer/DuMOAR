#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/fastqc-raw-20221031.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 20
#SBATCH -t 1000

# This script is for running FastQC and MultiQC on raw
# Dungeness crab MBDSeq data.
# NOTE - there were two files for each sample, corresponding to two lanes.
# Before running fastqc, I concatenated files by sample.

module load bio/fastqc/0.11.9
source /home/lspencer/venv/bin/activate

IN=/scratch/lspencer/DuMOAR/concatenated
OUT=/scratch/lspencer/DuMOAR/concatenated/fastqc

# store sample names to variable
SAMPLES=$(ls ${IN}/*_R1.fastq | \
awk -F "/" '{print $NF}' | \
awk -F "." '{print $1}' | \
sed -e 's/_R1//')

# loop through sample names
for sample in ${SAMPLES}
do
  # run fastqc on each raw read file (two per sample for R1 and R2)
fastqc \
--threads 20 \
${IN}/${sample}_R1.fastq \
${IN}/${sample}_R2.fastq \
--outdir ${OUT}
done

# Run multiqc to summarize fastqc reports
multiqc \
${OUT} \
--outdir ${OUT}
