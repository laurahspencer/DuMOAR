#!/bin/bash

#SBATCH --job-name=STAR_buildref
#SBATCH --output=STAR_buildref.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/star/2.7.10a

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/ref/HiC_STAR
MANIFEST=${BASE}/data/manifest.txt
OUT=${BASE}/star/for_trinity

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

STAR \
    --runThreadN 20 \
    --genomeDir ${REF} \
    --readFilesCommand zcat \
    --readFilesManifest ${MANIFEST} \
    --outFileNamePrefix ${OUT}/all.align. \
    --outSAMtype BAM Unsorted \
    --outSAMattributes NH HI AS nM RG \
    &> ${OUT}/star.align_for_trinity.log
