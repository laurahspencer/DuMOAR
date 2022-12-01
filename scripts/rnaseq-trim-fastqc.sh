#!/bin/bash

#SBATCH --job-name=trim-rnaseq
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/trim-rnaseq-20221121.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 8
#SBATCH -t 5-0:0:0

# This script is for trimming raw RNA-Seq data and
# filtering for quality and length.
# fastqc is also run on raw data and trimmed data
# It has been slightly adapted from code written by Giles Goetz

# First run fastqc on raw data
module load bio/fastqc/0.11.9
source /home/lspencer/venv/bin/activate

IN=/share/nwfsc/knichols/Dungeness/RNAseq_gill
OUT=/scratch/lspencer/DuMOAR/trimmed/rnaseq

### --- run fastqc & multiqc on raw data
fastqc \
--threads 8 \
${IN}/*.fastq.gz \
--outdir ${IN}/fastqc/

multiqc \
${IN}/fastqc/ \
--outdir ${IN}/fastqc/

### --- extract sample names
SAMPLES=$(ls ${IN}/*_R1_001.fastq.gz | \
awk -F "/" '{print $NF}' | \
awk -F "_" '{print $1}' | \
sed -e 's/_R1//')

### --- run cutadapt to trim raw data
for sample in ${SAMPLES}
do
    # Trimming the Illumina TruSeq adapters
    # Quality-trim  5’ end with cutoff=20 & 3’ end with cutoff=15
    # Trimming out leftover N's
    # Filtering out sequences shorter then 50bp
    cutadapt \
        -o ${OUT}/${sample}.trimmed.R1.fastq.gz \
        -p ${OUT}/${sample}.trimmed.R2.fastq.gz \
        -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
        -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
        -q 15,10 \
        -m 50 \
        --trim-n \
        --max-n 0.1 \
        --cores=8 \
        ${IN}/${sample}_R1_001.fastq.gz \
        ${IN}/${sample}_R2_001.fastq.gz \
        &> ${OUT}/cutadapt.${sample}.log

# Run fastqc on trimmed data files
    fastqc \
        --threads 8 \
        -o ${OUT}/fastqc/ \
        ${OUT}/${sample}.trimmed.R1.fastq.gz \
        ${OUT}/${sample}.trimmed.R2.fastq.gz \
        &> ${OUT}/fastqc/fastqc.${sample}.log
done

# Run multiqc to summarize fastqc reports
multiqc \
${OUT}/fastqc/ \
--outdir ${OUT}/fastqc/
