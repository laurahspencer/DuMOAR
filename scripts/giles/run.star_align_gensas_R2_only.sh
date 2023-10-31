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
IN=${BASE}/trimmed
OUT=${BASE}/star/scaffolds_only_gensas_R2_only

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

SAMPLES=$(ls ${IN}/*.R1.fastq.gz | awk -F "/" '{print $NF}' |
    awk -F "." '{print $1}')

for SAMPLE in ${SAMPLES}
do
    STAR \
        --runThreadN 20 \
        --genomeDir ${REF} \
        --readFilesCommand zcat \
        --readFilesIn ${IN}/${SAMPLE}.*.R2.fastq.gz \
        --outFileNamePrefix ${OUT}/${SAMPLE}. \
        --outSAMtype BAM SortedByCoordinate \
        --quantMode GeneCounts \
        &> ${OUT}/${SAMPLE}.star.align.log
done
