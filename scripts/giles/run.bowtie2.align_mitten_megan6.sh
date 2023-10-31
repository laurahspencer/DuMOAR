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
REF=${BASE}/ref/mitten/Mitten_BT2
IN=${BASE}/megan6/reads
OUT=${BASE}/bowtie2/mitten_megan6

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

SAMPLES=$(ls ${IN}/*_R1.fq.gz | awk -F "/" '{print $NF}' |
    awk -F "." '{print $3}')

SAMPLES_ARRAY=(${SAMPLES})
SAMPLES_ARRAY_SIZE=${#SAMPLES_ARRAY[@]}

sample=${SAMPLES_ARRAY[${SLURM_ARRAY_TASK_ID}-1]}

bowtie2 \
    -p 20 \
    -k 20 \
    -x ${REF} \
    -1 ${IN}/20230730.mmag.${sample}.*_R1.fq.gz \
    -2 ${IN}/20230730.mmag.${sample}.*_R2.fq.gz \
    -S ${OUT}/${sample}.sam \
    &> ${OUT}/${sample}.bowtie2.log
