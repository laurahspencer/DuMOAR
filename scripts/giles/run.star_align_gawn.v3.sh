#!/bin/bash

#SBATCH --job-name=STAR_AlignGAWN
#SBATCH --output=STAR_AlignGAWN.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/star/2.7.10a

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/ref/HiC_STAR_GAWN
MANIFEST=${BASE}/data/manifest.txt
OUT=${BASE}/star/scaffolds_only_gawn.v3

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
    --outTmpDir ${OUT}/_STARtmp \
    --quantMode GeneCounts \
    --outFilterScoreMinOverLread 0.33 \
    --outFilterMatchNminOverLread 0.33 \
    --outFilterMismatchNmax 2 \
    &> ${OUT}/star.align_for_trinity.log
