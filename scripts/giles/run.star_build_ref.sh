#!/bin/bash

#SBATCH --job-name=STAR_buildref
#SBATCH --output=STAR_buildref.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/star/2.7.10a

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
FASTA=/share/nwfsc/knichols/Dungeness/Phase_HiC_assembly/PGA_assembly.fasta.filtered.renamed.fa
REF=${BASE}/ref/HiC_STAR

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
    &> ${REF}/star.build_ref.log
