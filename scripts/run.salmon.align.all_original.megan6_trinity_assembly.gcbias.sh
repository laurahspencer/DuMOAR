#!/bin/bash

#SBATCH --job-name=Salmon_AlignRNA
#SBATCH --output=Salmon_AlignRNA.%A.%a.txt
#SBATCH -c 20
#SBATCH -t 0

#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

#SBATCH --array=1-24%6

module load aligners/salmon/1.9.0

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/ref/salmon/all.megan6
IN=${BASE}/trimmed
OUT=${BASE}/salmon/all_original.megan6_assembly.gcbias

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

SAMPLES=$(ls ${IN}/*R1.fastq.gz | awk -F "/" '{print $NF}' | 
    awk -F "." '{print $1}')

SAMPLES_ARRAY=(${SAMPLES})
SAMPLES_ARRAY_SIZE=${#SAMPLES_ARRAY[@]}

sample=${SAMPLES_ARRAY[${SLURM_ARRAY_TASK_ID}-1]}

salmon \
    quant \
    -i ${REF} \
    --libType A \
    -o ${OUT}/${sample}.quant \
    -1 ${IN}/${sample}.trimmed.R1.fastq.gz \
    -2 ${IN}/${sample}.trimmed.R2.fastq.gz \
    --validateMappings \
    -p 20 \
    --gcBias \
    &> ${OUT}/${sample}.salmon_quant.log
