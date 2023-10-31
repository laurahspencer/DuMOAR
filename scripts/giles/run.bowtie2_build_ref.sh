#!/bin/bash

#SBATCH --job-name=BT2_buildref
#SBATCH --output=BT2_buildref.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/bowtie2/2.5.0

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
FASTA=/share/nwfsc/knichols/Dungeness/Phase_HiC_assembly/PGA_assembly.fasta.filtered.renamed.fa
REF=${BASE}/ref/bowtie2

if [ ! -d ${REF} ]; then
    mkdir -p ${REF}
fi

bowtie2-build \
    --threads 20 \
    ${FASTA} \
    ${REF}/HiC_BT2 \
    &> ${REF}/bowtie2.build.log
