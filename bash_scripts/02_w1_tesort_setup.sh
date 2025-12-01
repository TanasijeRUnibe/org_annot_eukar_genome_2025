#!/bin/bash
#SBATCH --time=3-0
#SBATCH --mem=16G
#SBATCH -p pibu_el8
#SBATCH --cpus-per-task=4
#SBATCH --job-name=extractte
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/output_err/extractte_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/output_err/extractte.e

WORKDIR=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/extract_te_seq_week2
genome=$WORKDIR/hifisam.asm.bp.p_ctg.fa.mod.EDTA.TElib.fa
#Ignore helitron, plot all TIR above 0.1%

module load SeqKit/2.6.1
# Extract Copia sequences
seqkit grep -r -p "Copia" $genome > Copia_sequences.fa
# Extract Gypsy sequences
seqkit grep -r -p "Gypsy" $genome > Gypsy_sequences.fa

