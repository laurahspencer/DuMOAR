#!/bin/bash

#SBATCH --job-name=HISAT2_AlignGAWN
#SBATCH --output=HISAT2_AlignGAWN.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

#SBATCH --array=1-24%6
#SBATCH --exclude=node[29-36]

module load aligners/hisat2/2.2.1 

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/ref/HiC_HISAT2_GAWN/HiC_HISAT2
OUT=${BASE}/hisat2/scaffolds_only_gawn
IN=${BASE}/trimmed

SAMPLES=$(ls ${IN}/*R1.fastq.gz | awk -F "/" '{print $NF}' |
    awk -F "." '{print $1}')

SAMPLES_ARRAY=(${SAMPLES})
SAMPLES_ARRAY_SIZE=${#SAMPLES_ARRAY[@]}

SAMPLE=${SAMPLES_ARRAY[${SLURM_ARRAY_TASK_ID}-1]}

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

hisat2 \
    -x ${REF} \
    -1 ${IN}/${SAMPLE}.trimmed.R1.fastq.gz \
    -2 ${IN}/${SAMPLE}.trimmed.R2.fastq.gz \
    -S ${OUT}/${SAMPLE}.sam \
    --rg-id ${SAMPLE} \
    --threads 20 \
    &> ${OUT}/hisat2.${SAMPLE}.log
