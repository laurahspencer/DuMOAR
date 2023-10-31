#!/bin/bash

#SBATCH --job-name=BUSCO
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH --output=BUSCO.PGA_Assembly.ncbi_sub.%A.txt

# Activate BUSCO via conda
source /home/ggoetz/.bashrc
conda activate busco-5.3.2

# Setup env
BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/ref/fasta/PGA_assembly.fasta.filtered.renamed.fa
LINEAGE=arthropoda_odb10
OUT=${BASE}/busco/PGA_assembly.ncbi_sub.arthropoda_odb10

if [ ! -d ${OUT} ]; then
    mkdir -p ${OUT}
fi

cd ${OUT}

busco \
    -i ${REF} \
    -l ${LINEAGE} \
    -o ${LINEAGE} \
    --out_path ${OUT} \
    -m tran \
    --cpu 20 \
    &> ${OUT}/busco.${LINEAGE}.log
