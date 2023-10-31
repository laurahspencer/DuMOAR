#!/bin/bash

#SBATCH --job-name=cutadapt
#SBATCH --output=cutadapt.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

source ~/.bashrc

conda activate cutadapt

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
IN=/share/nwfsc/knichols/Dungeness/RNAseq_gill
OUT=${BASE}/trimmed

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

SAMPLES=$(ls ${IN}/*_R1_*.gz | \
    awk -F '/' '{print $NF}' | \
    awk -F "_" '{print $1}') 

for sample in ${SAMPLES}
do
    echo ${sample}
    cutadapt \
        -j 0 \
        -o ${OUT}/${sample}.trimmed.R1.fastq.gz \
        -p ${OUT}/${sample}.trimmed.R2.fastq.gz \
        -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
        -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
        -q 15,10 \
        -m 40 \
        --trim-n \
        ${IN}/${sample}_R1_*.fastq.gz \
        ${IN}/${sample}_R2_*.fastq.gz \
        &> ${OUT}/cutadapt.${sample}.log
done
