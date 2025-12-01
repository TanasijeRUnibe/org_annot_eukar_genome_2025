#!/bin/bash
#SBATCH --time=1-00:00:00
#SBATCH --mem=32G
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=16
#SBATCH --job-name=maker_merge
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/results_week2/MARKER/output_err/x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/results_week2/MARKER/output_err/x_%j.e
#SBATCH --mail-user=tanasije.rakic@students.unibe.ch
#SBATCH --mail-type=end

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
MAKERBIN="$COURSEDIR/softwares/Maker_v3.01.03/src/bin"
WORKDIR="/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/results_week2/MARKER/hifisam.asm.bp.p_ctg.maker.output/"
cd $WORKDIR
$MAKERBIN/gff3_merge -s -d hifisam.asm.bp.p_ctg_master_datastore_index.log > assembly.all.maker.gff
$MAKERBIN/gff3_merge -n -s -d hifisam.asm.bp.p_ctg_master_datastore_index.log > assembly.all.maker.noseq.gff
$MAKERBIN/fasta_merge -d hifisam.asm.bp.p_ctg_master_datastore_index.log -o assembly