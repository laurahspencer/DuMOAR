#!/bin/bash

#SBATCH --job-name=STAR_buildrefGENSAS
#SBATCH --output=STAR_buildref.GENSAS.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/star/2.7.10a

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
FASTA=${BASE}/ref/fasta/PGA_assembly.scaffolds_only.fasta
GTF=${BASE}/ref/fasta/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.scaffolds_only.gtf
REF=${BASE}/ref/HiC_STAR_GENSAS

if [ ! -d ${REF} ]; then
    mkdir -p ${REF}
fi

# Ran this once already but got a message saying to add this
# --genomeSAindexNbases 13
STAR \
    --runThreadN 20 \
    --runMode genomeGenerate \
    --genomeDir ${REF} \
    --genomeFastaFiles ${FASTA} \
    --genomeSAindexNbases 13 \
    --sjdbGTFfile ${GTF} \
    &> ${REF}/star.build_ref.log
