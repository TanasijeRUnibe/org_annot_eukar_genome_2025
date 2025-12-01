#!/bin/bash
#SBATCH --time=05:00:00
#SBATCH --mem=32G
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=8
#SBATCH --job-name=bed_prepare
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.e
#SBATCH --mail-user=tanasije.rakic@students.unibe.ch
#SBATCH --mail-type=end

Accession="RRS10"
FILENAME="filtered.genes.renamed.gff3"
cd /data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final

grep -P "\tgene\t" $FILENAME > temp_genes.gff3

awk 'BEGIN{OFS="\t"} {split($9,a,";"); split(a[1],b,"="); print $1, $4-1, $5, b[2]}' temp_genes.gff3 > ${Accession}.bed