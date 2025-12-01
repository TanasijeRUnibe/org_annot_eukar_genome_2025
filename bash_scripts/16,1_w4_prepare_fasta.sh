#!/bin/bash
#SBATCH --time=05:00:00
#SBATCH --mem=16G
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=8
#SBATCH --job-name=fasta_prepare
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.e
#SBATCH --mail-user=tanasije.rakic@students.unibe.ch
#SBATCH --mail-type=end

sed -E 's/(>[^ ]+).*/\1/' assembly.all.maker.proteins.renamed.filtered.fasta \
    > RRS10.cleaned.fa
