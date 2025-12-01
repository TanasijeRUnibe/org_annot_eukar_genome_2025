#!/bin/bash
#SBATCH --job-name=riparian
#SBATCH --partition=pibu_el8
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.e

############################################################
# Paths you MUST define
############################################################

# Course directory containing the GENESPACE container
COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"

# Your working directory
WORKDIR="/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes"

# GENESPACE working directory
GWD="$WORKDIR/GENESPACE/genespace_WD"

# Your R script
RSCRIPT="/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/GENESPACE/genespace_WD/scripts/riparian_plots.R"

############################################################
# Run the riparian R script inside the GENESPACE container
############################################################

apptainer exec \
  --bind /data \
  --bind $WORKDIR \
  --bind $SCRATCH:/temp \
  $COURSEDIR/containers/genespace_latest.sif \
  Rscript $RSCRIPT $GWD
