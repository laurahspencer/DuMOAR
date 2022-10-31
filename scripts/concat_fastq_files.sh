#!/bin/bash
#SBATCH --output=/home/lspencer/pcod-2022/sbatch/concat-mbdbs_20221026.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 8
#SBATCH -t 5-0:0:0

IN=/share/nwfsc/knichols/Dungeness/MBDseq_UOdata
OUT=/scratch/lspencer/DuMOAR/concatenated

FOLDERS=$(ls -1d ${IN}/441* | awk -F "/" '{ print $NF }')

for folder in ${FOLDERS}
do
    echo ${folder}
    SUB_FOLDER=${IN}/${folder}
    SAMPLES=$(ls ${SUB_FOLDER}/*_R1_*.fastq.gz | \
        awk -F "/" '{ print $NF }' | \
        awk -F "_" '{ print $1"_"$2"_"$3 }')

    for sample in ${SAMPLES}
    do
        echo ${sample}
        cat ${SUB_FOLDER}/${sample}_*_R1_*.fastq.gz \
            >> ${OUT}/${sample}_R1.fastq
        cat ${SUB_FOLDER}/${sample}_*_R2_*.fastq.gz \
            >> ${OUT}/${sample}_R2.fastq
    done
done
