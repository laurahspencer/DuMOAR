#!/bin/bash

#SBATCH --job-name=Salmon_Build
#SBATCH --output=Salmon_Build.%A.txt
#SBATCH -c 20
#SBATCH -t 0

#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

module load aligners/salmon/1.9.0

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
FASTA=${BASE}/trinity/all/trinity_denovo.Trinity.fasta
REF=${BASE}/ref/salmon/all

salmon \
    index \
    -t ${FASTA} \
    -i ${REF} \
    -k 31 \
    &> ${BASE}/ref/salmon/salmon.index.all.log 
