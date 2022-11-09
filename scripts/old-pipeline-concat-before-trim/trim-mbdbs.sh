#!/bin/bash

#SBATCH --job-name=trim-mbdbs
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/trim-mbdbs-20221027.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 8
#SBATCH -t 7-0:0:0

# DuMOAR Project
# This script is for trimming and quality filtering raw MBD-BS data
# generated from Dungeness crab exposed to two pH conditions during early life.

source /home/lspencer/venv/bin/activate
source ~/.bashrc
conda activate trim-galore-0.6.7
module load bio/fastqc/0.11.9

IN=/scratch/lspencer/DuMOAR/concatenated
OUT=/scratch/lspencer/DuMOAR/trimmed

# Run TrimGalore paired end using default adapter identification
find ${IN}/*_R1.fastq | \
xargs basename -s _R1.fastq | \
xargs -I{} trim_galore \
--cores 8 \
--output_dir ${OUT} \
--paired \
--fastqc_args \
"--outdir ${OUT}/fastqc \
--threads 20" \
--illumina \
--clip_R1 10 \
--clip_R2 10 \
--three_prime_clip_R1 10 \
--three_prime_clip_R2 10 \
--path_to_cutadapt cutadapt \
${IN}/{}_R1.fastq \
${IN}/{}_R2.fastq

# Run multiqc on trimmed MBD-BS samples

multiqc \
fastqc/
