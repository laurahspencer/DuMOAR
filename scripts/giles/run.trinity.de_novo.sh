#!/bin/bash

#SBATCH --job-name=TrinityDN
#SBATCH --output=TrinityDN.%A.txt
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -p himem

source ~/.bashrc

conda activate trinity-2.14.0 

module load bio/jellyfish/2.3.0
module load aligners/bowtie2/2.4.2
module load aligners/salmon/1.4.0
module load bio/samtools/1.15.1

export TRINITY_HOME=/opt/bioinformatics/build/trinityrnaseq-v2.14.0
export PATH=/opt/bioinformatics/build/trinityrnaseq-v2.14.0:${PATH}

BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
IN=${BASE}/trimmed
OUT=${BASE}/trinity

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

FILES_R1=$(ls ${IN}/CH*R1*.gz | tr '\n' ',' | sed -e 's/,$//')
FILES_R2=$(ls ${IN}/CH*R2*.gz | tr '\n' ',' | sed -e 's/,$//')

echo ${FILES_R1}
echo ${FILES_R2}

Trinity \
    --seqType fq \
    --CPU 24 \
    --output ${OUT}/trinity_denovo \
    --max_memory 1200G \
    --left ${FILES_R1} \
    --right ${FILES_R2} \
    &> ${OUT}/trinity.denovo.log
