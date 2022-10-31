#!/bin/bash

#SBATCH --job-name=meth-pipeline
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/meth-20221026.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 20
#SBATCH -t 21-0:0:0

## NOTE: THIS SCRIPT WAS BROKEN UP INTO MULTIPLE SCRIPTS - ONLY USE THIS FOR REFERENCE! SHOULD DELETE ONCE BISMARK ETC. IS DONE!

module load bio/fastqc/0.11.9
source /home/lspencer/venv/bin/activate
source ~/.bashrc
conda activate trim-galore-0.6.7
module load bio/bismark/0.24.0

REF=/home/lspencer/references/gadMor3.0/GCF_902167405.1
IN=/scratch/lspencer/DuMOAR/concatenated
OUT=/scratch/lspencer/DuMOAR/trimmed

#IN=/scratch/lspencer/DuMOAR/trimmed
#OUT=/scratch/lspencer/DuMOAR/aligned

# Run TrimGalore paired end using default adapter identification
find ${IN}*_R1.fastq | \
xargs basename -s _R1.fastq | \
xargs -I{} /gscratch/srlab/programs/TrimGalore-0.6.6/trim_galore \ #<-- UPDATE
--cores 20 \
--output_dir ${OUT} \
--paired \
--fastqc_args \
"--outdir ${OUT}/fastqc \
--threads 20" \
--illumina \
--clip_R1 10 \
--clip_R2 10 \
--three_prime_clip_R1 10 \
--three_prime_clip_R2 10 \
--path_to_cutadapt /home/lspencer/venv/bin/cutadapt \
${IN}{}_R1.fastq \
${IN}{}_R1.fastq


# Run multiqc for WGBS and MBD samples

multiqc \
fastqc/.

# Move to where trimmed files are
cd trimmed/

# Run Bismark to align trimmed reads, then deduplicate and call methylation status

# Prepare genome
bismark_genome_preparation \
--verbose \
--parallel 20 \
#--path_to_aligner bowtie2 \
${REF}

find *_R1_val_1.fq \
| xargs basename -s _R1_val_1.fq | xargs -I{} bismark \
#--path_to_bowtie bowtie2 \
-genome ${REF} \
-p 20 \
-score_min L,0,-0.6 \
--non_directional \
-1 {}_R1_val_1.fq \
-2 {}_R2_val_1.fq \
-o ${OUT}

# From here we extract methylation and create downstream amendable files.
# First make new directory for deduplicated files

cd ../bismark/

find *.bam | \
xargs basename -s .bam | \
xargs -I{} ${bismark_dir}/deduplicate_bismark \
--bam \
--paired \
{}.bam

${bismark_dir}/bismark_methylation_extractor \
--bedGraph --counts --scaffolds \
--multicore 14 \
--buffer_size 75% \
*deduplicated.bam


# Bismark processing report

${bismark_dir}/bismark2report

#Bismark summary report

${bismark_dir}/bismark2summary
