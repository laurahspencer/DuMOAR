#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/fastqc-raw-not-concat-20221103.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 20
#SBATCH -t 1000

# This script is for running FastQC and MultiQC on raw (not concatenated!)
# Dungeness crab MBDSeq data.

module load bio/fastqc/0.11.9
source /home/lspencer/venv/bin/activate

IN=/share/nwfsc/knichols/Dungeness/MBDseq_UOdata
OUT=/home/lspencer/DuMOAR/fastqc

# store sample names to variable
SAMPLES=$(ls ${IN}/4416/*_R1_*.fastq.gz | \
    awk -F "/" '{ print $NF }' | \
    awk -F "_" '{ print $1"_"$2"_"$3 }')

# loop through sample names - in subdirectory 4416/
for sample in ${SAMPLES}
do
  # run fastqc on each raw read file (two per sample for R1 and R2)
fastqc \
--threads 20 \
${IN}/4416/${sample}_L001_R1_001.fastq.gz \
${IN}/4416/${sample}_L001_R2_001.fastq.gz \
--outdir ${OUT}/raw_4416/
done

# Run multiqc to summarize fastqc reports
multiqc \
${OUT}/raw_4416/ \
--outdir ${OUT}/raw_4416/

####
# loop through sample names - in subdirectory 4417/
for sample in ${SAMPLES}
do
  # run fastqc on each raw read file (two per sample for R1 and R2)
fastqc \
--threads 20 \
${IN}/4417/${sample}_L001_R1_001.fastq.gz \
${IN}/4417/${sample}_L001_R2_001.fastq.gz \
--outdir ${OUT}/raw_4417/
done

# Run multiqc to summarize fastqc reports
multiqc \
${OUT}/raw_4417/ \
--outdir ${OUT}/raw_4417/
