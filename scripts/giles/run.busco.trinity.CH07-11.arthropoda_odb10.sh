#!/bin/bash

#SBATCH --job-name=BUSCO
#SBATCH -c 20
#SBATCH -t 0
#SBATCH --mail-user=giles.goetz@noaa.gov
#SBATCH --mail-type=ALL

# Activate BUSCO via conda
source /home/ggoetz/.bashrc
conda activate busco-5.3.2

# Setup env
BASE=/share/nwfsc/ggoetz/202301-dungeness_crab-transcriptome
REF=${BASE}/trinity/CH07-11/trinity_denovo.Trinity.fasta
LINEAGE=arthropoda_odb10
OUT=${BASE}/busco/trinity.CH07-11.arthropoda_odb10

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
    &> ${OUT}/busco.${LINEAGE}.arthropoda_odb10.log