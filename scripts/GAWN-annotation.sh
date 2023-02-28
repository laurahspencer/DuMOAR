#!/bin/bash

#SBATCH --job-name=GAWN-annotation
#SBATCH --output=/home/lspencer/DuMOAR/sbatch/GAWN-annotation-20230228.txt
#SBATCH --mail-user=laura.spencer@noaa.gov
#SBATCH --mail-type=ALL
#SBATCH -c 20
#SBATCH -t 10-0:0:0

# This script is for running the GAWN genome annotation program on Dungeness crab genome
## Before running, I followed these instructions on the GAWN github:
# Install dependencies - Giles did this, some can be accessed in this conda environment

conda activate gawn-0.3.5

# Download GAWN repository (see Installation section above) - saved to /home/lspencer/references/
# Put your genome and transcriptome fasta files (uncompressed) in 03_data
# Edit the parameters in 02_info/gawn_config.sh (you can rename the file)

cd /home/lspencer/references/dungeness/gawn-master

./gawn 02_infos/gawn_config.sh
