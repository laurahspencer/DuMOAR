#!/bin/bash

#SBATCH --job-name=trim-mbdbs
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/trim-mbdbs-before-concat-20221107.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 20
#SBATCH -t 7-0:0:0

# DuMOAR Project
# This script is for trimming and quality filtering raw MBD-BS data
# generated from Dungeness crab exposed to two pH conditions during early life.
# NOTE: each library was sequenced twice, thus there are two data folders (4416, 4417).
# 4416/ contains 100bp reads, and 4417/ contains 150bp reads.
# Here we trim/filter reads from each run separately, i.e. we do NOT concatenate them by sample first.

source /home/lspencer/venv/bin/activate
source ~/.bashrc
conda activate trim-galore-0.6.7
module load bio/fastqc/0.11.9

IN=/share/nwfsc/knichols/Dungeness/MBDseq_UOdata
OUT=/scratch/lspencer/DuMOAR/trimmed/before-concat

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
      # Run TrimGalore paired end using default adapter identification
      trim_galore \
      --cores 8 \
      --output_dir ${OUT}/${folder} \
      --paired \
      --fastqc_args \
      "--outdir ${OUT}/${folder}/fastqc \
      --threads 20" \
      --illumina \
      --clip_R1 10 \
      --clip_R2 10 \
      --three_prime_clip_R1 10 \
      --three_prime_clip_R2 10 \
      --path_to_cutadapt cutadapt \
      ${IN}/${folder}/${sample}_L001_R1_001.fastq.gz \
      ${IN}/${folder}/${sample}_L001_R2_001.fastq.gz
    done

    # Run multiqc on trimmed MBD-BS samples
    multiqc \
    ${OUT}/${folder}/fastqc/ \
    ${OUT}/${folder}/fastqc/

done
