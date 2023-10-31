#!/bin/bash

#SBATCH --job-name=STAR_buildrefMitten
#SBATCH --output=STAR_buildref.Mitten.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mem=180G
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/star/2.7.10a

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
FASTA=${BASE}/ref/mitten/ESIN_genome.fa
GTF=${BASE}/ref/mitten/ESIN_genome.gtf
REF=${BASE}/ref/mitten/STAR_REF

if [ ! -d ${REF} ]; then
    mkdir -p ${REF}
fi

STAR \
    --runThreadN 20 \
    --runMode genomeGenerate \
    --genomeDir ${REF} \
    --genomeFastaFiles ${FASTA} \
    --sjdbGTFfile ${GTF} \
    --limitGenomeGenerateRAM 150000000000 \
    &> ${REF}/star.build_ref.log
