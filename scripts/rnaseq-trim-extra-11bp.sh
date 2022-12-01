#!/bin/bash

#SBATCH --job-name=hardtrim-rnaseq
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/hardtrim-rnaseq-20221129.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 8
#SBATCH -t 5-0:0:0

# This script is for hard-trimming 10 bp from 5' end of rnaseq reads

# First run fastqc on raw data
module load bio/fastqc/0.11.9
source /home/lspencer/venv/bin/activate

IN=/scratch/lspencer/DuMOAR/trimmed/rnaseq
OUT=/home/lspencer/DuMOAR/data/rnaseq-trimmed

### --- extract file prefixes and run cutadapt on each file to remove 11bp from 5' ends
find ${IN}/*fastq.gz | \
xargs basename -s .fastq.gz | \
xargs -I{} cutadapt \
        -o ${OUT}/{}.11bp.fastq.gz \
        --cut 11 \
        ${IN}/{}.fastq.gz \
        &> ${OUT}/cutadapt.{}.11bp.log

### Run fastqc and multiqc on samples with extra 10bp trimmed - need to run multqc using paired-end parameter

### --- extract sample names
SAMPLES=$(ls ${OUT}/*.trimmed.R1.11bp.fastq.gz | \
awk -F "/" '{print $NF}' | \
awk -F "." '{print $1}' | \
sed -e 's/.R1//')

# Run fastqc on trimmed data files
for sample in ${SAMPLES}
do
      fastqc \
          --threads 8 \
          -o ${OUT}/fastqc/ \
          ${OUT}/${sample}.trimmed.R1.11bp.fastq.gz \
          ${OUT}/${sample}.trimmed.R2.11bp.fastq.gz \
          &> ${OUT}/fastqc/fastqc.${sample}.11bp.log
  done

#  # Run multiqc to summarize fastqc reports
# this code didn't work, directory issues
#  multiqc \
#  ${OUT}/fastqc/*.11bp.fastq.gz \
#  --outdir ${OUT}/fastqc/rnaseq-11bp
