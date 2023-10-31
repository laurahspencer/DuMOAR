#!/bin/bash

#SBATCH --job-name=STAR_AlignGENSAS
#SBATCH --output=STAR_AlignGENSAS.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/star/2.7.10a

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/ref/HiC_STAR_GENSAS
MANIFEST=${BASE}/data/manifest.txt
OUT=${BASE}/star/scaffolds_only_gensas.v2

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
    &> ${OUT}/star.align_for_trinity.log
