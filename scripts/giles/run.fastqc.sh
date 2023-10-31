#!/bin/bash

#SBATCH --job-name=FASTQC
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load bio/fastqc/0.11.9

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
IN=/share/nwfsc/knichols/Dungeness/RNAseq_gill
OUT=${BASE}/fastqc/raw

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

cd ${BASE}

fastqc \
    -t 20 \
    -o ${OUT} \
    ${IN}/*.gz \
    &> ${OUT}/fastqc.log
