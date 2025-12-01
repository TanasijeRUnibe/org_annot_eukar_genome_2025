#!/bin/bash
#SBATCH --time=1-00:00:00
#SBATCH --mem=32G
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=16
#SBATCH --job-name=busco1
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.e

module load BUSCO/5.4.2-foss-2021a
busco -i longest_per_gene_prot.fa -l brassicales_odb10 -o busco_output -m proteins
busco -i longest_per_gene_trans.fa -l brassicales_odb10 -o busco_output -m transcriptome