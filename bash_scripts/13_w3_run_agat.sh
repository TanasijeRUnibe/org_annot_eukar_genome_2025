#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --mem=20G
#SBATCH --partition=pibu_el8
#SBATCH --job-name=agat
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.e
#SBATCH --mail-user=tanasije.rakic@students.unibe.ch
#SBATCH --mail-type=end

WORKDIR="/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final"
CONTAINER="/containers/apptainer/agat-1.2.0.sif"

cd $WORKDIR
apptainer exec --bind /data $CONTAINER agat_sp_statistics.pl -i filtered.genes.renamed.gff3 -o annotation.stat