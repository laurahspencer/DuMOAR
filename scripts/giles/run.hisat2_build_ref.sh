#!/bin/bash

#SBATCH --job-name=HISAT2_buildref
#SBATCH --output=HISAT2_buildref.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/hisat2/2.2.1

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
FASTA=/share/nwfsc/knichols/Dungeness/Phase_HiC_assembly/PGA_assembly.fasta.filtered.renamed.fa
REF=${BASE}/ref/hisat2

if [ ! -d ${REF} ]; then
    mkdir -p ${REF}
fi

hisat2-build \
    -p 20 \
    ${FASTA} \
    ${REF}/HiC_HISAT2 \
    &> ${REF}/hisat2-build.log
