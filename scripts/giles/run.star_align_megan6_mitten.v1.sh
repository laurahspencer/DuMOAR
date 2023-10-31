#!/bin/bash

#SBATCH --job-name=STAR_AlignM6Mitten
#SBATCH --output=STAR_AlignM6Mitten.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/star/2.7.10a

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/ref/mitten/STAR_REF
IN=${BASE}/megan6/reads
OUT=${BASE}/star/mitten_megan6

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

SAMPLES=$(ls ${IN}/*_R1.fq.gz | awk -F "/" '{print $NF}' |
    awk -F "." '{print $3}')

for SAMPLE in ${SAMPLES}
do
    STAR \
        --runThreadN 20 \
        --genomeDir ${REF} \
        --readFilesCommand zcat \
        --readFilesIn ${IN}/20230730.mmag.${SAMPLE}.*_R1.fq.gz ${IN}/20230730.mmag.${SAMPLE}.*_R2.fq.gz \
        --outFileNamePrefix ${OUT}/${SAMPLE}. \
        --outSAMtype BAM SortedByCoordinate \
        --quantMode GeneCounts \
        &> ${OUT}/star.align.${SAMPLE}.log
done
