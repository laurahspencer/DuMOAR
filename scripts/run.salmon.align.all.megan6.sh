#!/bin/bash

#SBATCH --job-name=Salmon_AlignRNA
#SBATCH --output=Salmon_AlignRNA.%A.%a.txt
#SBATCH -c 20
#SBATCH -t 0

#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

#SBATCH --array=1-24%6
#SBATCH --exclude=node[29-36]

module load aligners/salmon/1.9.0

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/ref/salmon/all.megan6
IN=${BASE}/megan6/reads
OUT=${BASE}/salmon/all.megan6

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

SAMPLES=$(ls ${IN}/*_R1.fq.gz | awk -F "/" '{print $NF}' |
    awk -F "." '{print $3}')

SAMPLES_ARRAY=(${SAMPLES})
SAMPLES_ARRAY_SIZE=${#SAMPLES_ARRAY[@]}

sample=${SAMPLES_ARRAY[${SLURM_ARRAY_TASK_ID}-1]}

salmon \
    quant \
    -i ${REF} \
    --libType A \
    -o ${OUT}/${sample}.quant \
    -1 ${IN}/20230730.mmag.${sample}.*_R1.fq.gz \
    -2 ${IN}/20230730.mmag.${sample}.*_R2.fq.gz \
    --validateMappings \
    -p 20 \
    &> ${OUT}/${sample}.salmon_quant.log
