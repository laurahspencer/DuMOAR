#!/bin/bash

# I ran this script interactively on Sedna to make new genome feature files for gene-flanking regions, then identify DMLs located in and around genes. 

module load bio/samtools/1.19
module load bio/bedtools/2.29.2

REF=/home/lspencer/references/dungeness
BASE=/home/lspencer/DuMOAR/methyl

# We already have .gff3 file with gene locations along genome, but we also need .gff3's of flanking regions, so first we need to create those to then look for DMLs in flanking regions. 

## Create .gff file containing regions 2kb up- and down-stream of genes.

## First, generate a "genome file", which defines size of each chromosome. This is so the `slop` function restricts results to within a contig. 
samtools faidx --output ${REF}/PGA_assembly.scaffolds_only.fasta		# First index the FASTA file 
cut -f 1,2 ${REF}/PGA_assembly.scaffolds_only.fasta.fai > ${REF}/PGA_assembly.scaffolds_only.sizes #Extract column 1 (contig name) and column 2 (# bases in the contig) from index file

## Our .gff3 contains multiple feature types (genes, CDS, exons) and features in unscaffolded contigs. To look for flanking regions we just want genes in scaffolds used for alignment (no unscaffolded contigs, this confuses bedtools flank). So, we need to first create a filtered .gff3: 
grep --invert-match "unscaffolded" ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.gff3 | \
grep "gene" > ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.scaffolds_only.gff3

# NOTE: to double check that I removed only unscaffolded entries, I counted up the number
# cat /home/lspencer/references/dungeness/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.gff3 | wc -l # Total number entries in original .gff3 = 288,223
#  cat /home/lspencer/references/dungeness/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.scaffolds_only.gff3 | wc -l # Number entries in filtered .gff3 = 253,095 
# grep "unscaffolded" ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.gff3 | wc -l  # Number unscaffolded entries in original .gff3 = 35,128
# Good, 288,223 - 253,095 = 35,128. All good! 

## Then `bedtools flank` with the gene feature file to create 1) downtream flanking region (+2kb downstream, 3'), and 2) upstream flanking region (-2kb upstream, 5')

## Downstream / 3' (using the `-r` option to indicate "add") 
bedtools flank \
-i ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.scaffolds_only.gff3 \
-g ${REF}/PGA_assembly.scaffolds_only.sizes \
-r 2000 \
-l 0 \
> ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.2kbflank-down.gff

## Upstream / 5' (using the `-l` option to indicate "subtract") 
bedtools flank \
-i ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.scaffolds_only.gff3 \
-g ${REF}/PGA_assembly.scaffolds_only.sizes \
-l 2000 \
-r 0 \
> ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.2kbflank-up.gff

# Now we can identify genes containing DMLS, gene-flanking regions containing DMLs (and genes/gene-flanking regions containing any analyzed CpG locus, as background). 

# Identify genes containing DMLs
bedtools intersect -wb -a ${BASE}/dml25.bed -b ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.gff3 > ${BASE}/dml25-genes.tab

# Identify genes containing any locus that we analyzed 
bedtools intersect -wb -a ${BASE}/mydiff-all.bed -b ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.gff3 > ${BASE}/all-mbd-genes.tab

# Identify gene-flanking regions containing DMLs
bedtools intersect -wb -a ${BASE}/dml25.bed -b ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.2kbflank-down.gff >  ${BASE}/dml25-2kb-down-genes.tab
bedtools intersect -wb -a ${BASE}/dml25.bed -b ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.2kbflank-up.gff >  ${BASE}/dml25-2kb-up-genes.tab

# Identify gene-flanking regions containing any locus that we analyzed 
bedtools intersect -wb -a ${BASE}/mydiff-all.bed -b ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.2kbflank-down.gff > ${BASE}/all-mbd-2kb-down-genes.tab
bedtools intersect -wb -a ${BASE}/mydiff-all.bed -b ${REF}/GenSaS/Metacarcinus-magister-v1.0.a1.6448195bde6ca-publish.genes.2kbflank-up.gff > ${BASE}/all-mbd-2kb-up-genes.tab