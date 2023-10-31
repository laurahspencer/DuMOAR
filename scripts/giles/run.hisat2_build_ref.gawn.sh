#!/bin/bash

#SBATCH --job-name=HISAT2_buildref
#SBATCH --output=HISAT2_buildref.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mem=175G
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/hisat2/2.2.1

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
FASTA=${BASE}/ref/fasta/PGA_assembly.scaffolds_only.fasta
GTF=${BASE}/ref/fasta/PGA_assembly.scaffolds_only.gtf
EXONS=${BASE}/ref/fasta/PGA_assembly.scaffolds_only.exons.tsv
SS=${BASE}/ref/fasta/PGA_assembly.scaffolds_only.splicesites.tsv
REF=${BASE}/ref/HiC_HISAT2_GAWN

if [ ! -d ${REF} ]; then
    mkdir -p ${REF}
fi

hisat2-build \
    -p 20 \
    --ss ${SS} \
    --exon ${EXONS} \
    ${FASTA} \
    ${REF}/HiC_HISAT2 \
    &> ${REF}/hisat2-build.log
