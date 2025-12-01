#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=16G
#SBATCH -p pibu_el8
#SBATCH --cpus-per-task=8
#SBATCH --job-name=tesort
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/output_err/tesort_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/output_err/tesort_%j.e

WORKDIR=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/extract_te_seq_week2

apptainer exec --bind $WORKDIR /data/courses/assembly-annotation-course/CDS_annotation/containers/TEsorter_1.3.0.sif TEsorter Copia_sequences.fa -db rexdb-plant 
apptainer exec --bind $WORKDIR /data/courses/assembly-annotation-course/CDS_annotation/containers/TEsorter_1.3.0.sif TEsorter Gypsy_sequences.fa -db rexdb-plant