#!/bin/bash

#SBATCH --job-name=TrinityCH07-11
#SBATCH --output=TrinityCH07-11.%A.txt
#SBATCH -c 24 
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
OUT=${BASE}/trinity/CH07-11

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

FILES_R1=${IN}/CH07-11.trimmed.R1.fastq.gz
FILES_R2=${IN}/CH07-11.trimmed.R2.fastq.gz

Trinity \
    --seqType fq \
    --CPU 24 \
    --output ${OUT}/trinity_denovo \
    --max_memory 1200G \
    --left ${FILES_R1} \
    --right ${FILES_R2} \
    --bflyHeapSpaceMax 30G \
    &> ${OUT}/trinity.denovo.CH07-11.log
