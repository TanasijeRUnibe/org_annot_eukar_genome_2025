#!/bin/bash

#SBATCH --time=4-00:00:00
#SBATCH --mem=250G
#SBATCH --cpus-per-task=28
#SBATCH --job-name=edta_rerun
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/output_err/%x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/output_err/%x_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes
CONTAINER=/data/courses/assembly-annotation-course/CDS_annotation/containers/EDTA2.2.sif
INPUT_FASTA=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/hifisam.asm.bp.p_ctg.fa
OUTDIR=$WORKDIR/ZEDTA_rerun

mkdir -p "$OUTDIR"
cd "$OUTDIR"

apptainer run --bind /data \
    "$CONTAINER" \
    EDTA.pl \
    --genome $INPUT_FASTA \
    --species others \
    --step all \
    --sensitive 1 \
    --cds "/data/courses/assembly-annotation-course/CDS_annotation/data/TAIR10_cds_20110103_representative_gene_model_updated" \
    --anno 1 \
    --threads 28

#job never finished, but output seems to be ok
