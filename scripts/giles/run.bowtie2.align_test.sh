#!/bin/bash

#SBATCH --job-name=BT_AlignRNA
#SBATCH --output=BT_AlignRNA.%A.%a.txt
#SBATCH -c 20
#SBATCH -t 0

#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

#SBATCH --array=1-24%6

module load aligners/bowtie2/2.5.0

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/ref/bowtie2/HiC_BT2
IN=${BASE}/trimmed
OUT=${BASE}/bowtie2/test

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

SAMPLES=$(ls ${IN}/*R1.fastq.gz | awk -F "/" '{print $NF}' | 
    awk -F "." '{print $1}')

SAMPLES_ARRAY=(${SAMPLES})
SAMPLES_ARRAY_SIZE=${#SAMPLES_ARRAY[@]}

sample=${SAMPLES_ARRAY[${SLURM_ARRAY_TASK_ID}-1]}

bowtie2 \
    -p 20 \
    -k 20 \
    -x ${REF} \
    -1 ${IN}/${sample}.trimmed.R1.fastq.gz \
    -2 ${IN}/${sample}.trimmed.R2.fastq.gz \
    -S ${OUT}/${sample}.sam \
    &> ${OUT}/${sample}.bowtie2.log
