#!/bin/bash

#SBATCH --job-name=SAMTOOLS
#SBATCH --output=SAMTOOLS.%A.txt
#SBATCH -c 20
#SBATCH -t 0

#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load bio/samtools/1.15.1

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
IN=${BASE}/trimmed
OUT=${BASE}/bowtie2/test

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

SAMPLES=$(ls ${IN}/*R1.fastq.gz | awk -F "/" '{print $NF}' | 
    awk -F "." '{print $1}')

for sample in ${SAMPLES}
do
    samtools view -b ${OUT}/${sample}.sam > ${OUT}/${sample}.bam
    samtools sort \
        --threads 20 \
        -o ${OUT}/${sample}.sorted.bam \
        ${OUT}/${sample}.bam
    samtools index ${OUT}/${sample}.sorted.bam
    rm ${OUT}/${sample}.sam ${OUT}/${sample}.bam
done
