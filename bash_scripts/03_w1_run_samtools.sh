#!/bin/bash
#SBATCH --job-name=samtools
#SBATCH --partition=pibu_el8 
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --time=1-00:00
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/output_err/%x_%j.out
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/output_err/%x_%j.err
# User-editable variables
WORKDIR=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes
CONTAINER=/containers/apptainer/samtools-1.19.sif
INPUT_FASTA=$WORKDIR/hifisam.asm.bp.p_ctg.fa
OUTDIR=$WORKDIR/results_week2/samtools

mkdir -p "$OUTDIR"
cd "$OUTDIR"

apptainer exec --bind /data $CONTAINER samtools faidx $INPUT_FASTA --output hifiasm_assembly.fai
