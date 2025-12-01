#!/bin/bash
#SBATCH --time=05:00:00
#SBATCH --mem=40G
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=20
#SBATCH --job-name=genspace_savedds
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.e
#SBATCH --mail-user=tanasije.rakic@students.unibe.ch
#SBATCH --mail-type=end

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
WORKDIR="/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes"
genespaceR="/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/GENESPACE/genespace_WD/scripts/genespace.r"
#pangenomeR="/data/users/asteiner/assembly_annotation_course/scripts_annotation/riparian_plots.R"
CONTAINER="/data/courses/assembly-annotation-course/CDS_annotation/containers/genespace_latest.sif"

cd $WORKDIR/GENESPACE
#apptainer exec --bind /data --bind $SCRATCH:/temp $CONTAINER Rscript $genespaceR $WORKDIR/GENESPACE/genespace_WD
#apptainer exec --bind /data --bind $SCRATCH:/temp $CONTAINER Rscript $pangenomeR $WORKDIR/GENESPACE/genespace_WD

apptainer exec \
  --bind /data \
  --bind $WORKDIR \
  --bind $SCRATCH:/temp \
  $COURSEDIR/containers/genespace_latest.sif \
  Rscript $genespaceR $WORKDIR/GENESPACE/genespace_WD
