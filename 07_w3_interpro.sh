#!/bin/bash
#SBATCH --time=1-00:00:00
#SBATCH --mem=32G
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=16
#SBATCH --job-name=interpro
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/interpro_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/interpro_%j.e
#SBATCH --mail-user=tanasije.rakic@students.unibe.ch
#SBATCH --mail-type=end

WORKDIR="/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes"
COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
MAKERBIN="$COURSEDIR/softwares/Maker_v3.01.03/src/bin"
protein="assembly.all.maker.proteins"
transcript="assembly.all.maker.transcripts"
gff="assembly.all.maker.noseq"
prefix="RRS"

apptainer exec \
--bind $COURSEDIR/data/interproscan-5.70-102.0/data:/opt/interproscan/data \
--bind $WORKDIR \
--bind $COURSEDIR \
--bind $SCRATCH:/temp \
$COURSEDIR/containers/interproscan_latest.sif \
/opt/interproscan/interproscan.sh \
-appl pfam --disable-precalc -f TSV \
--goterms --iprlookup --seqtype p \
-i ${protein}.renamed.fasta -o output.iprscan
