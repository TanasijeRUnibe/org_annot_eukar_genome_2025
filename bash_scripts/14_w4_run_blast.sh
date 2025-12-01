#!/bin/bash
#SBATCH --time=05:00:00
#SBATCH --mem=40G
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=20
#SBATCH --job-name=blastp3
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.e
#SBATCH --mail-user=tanasije.rakic@students.unibe.ch
#SBATCH --mail-type=end

WORKDIR="/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final"
UNIPROT="/data/courses/assembly-annotation-course/CDS_annotation/data/uniprot/uniprot_viridiplantae_reviewed.fa"
#MAKERPROTEIN="/data/users/asteiner/assembly_annotation_course/gene_annotation/GFF/assembly.all.maker.proteins.fasta"
MAKERPROTEIN=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/longest_per_gene_prot.fa
GENES_GFF3=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/filtered.genes.renamed.gff3
MAKERBIN="/data/courses/assembly-annotation-course/CDS_annotation/softwares/Maker_v3.01.03/src/bin"

mkdir -p $WORKDIR/blast
mkdir -p $WORKDIR/blast/blastp_output
mkdir -p $WORKDIR/blast/blastp_output_TAIR10
cd $WORKDIR/blast

module load BLAST+/2.15.0-gompi-2021a
blastp -query $MAKERPROTEIN -db $UNIPROT -num_threads 10 -outfmt 6 -evalue 1e-5 -max_target_seqs 10 -out $WORKDIR/blast/blastp_output/blastp_output.besthits
# Now sort the blast output to keep only the best hit per query sequence
sort -k1,1 -k12,12g $WORKDIR/blast/blastp_output/blastp_output.besthits | sort -u -k1,1 --merge > $WORKDIR/blast/blastp_output.besthits

BLAST_OUTPUT=$WORKDIR/blast/blastp_output
BLAST_BESTHITS=$WORKDIR/blast/blastp_output.besthits

cp $MAKERPROTEIN maker_proteins.fasta.Uniprot
cp $GENES_GFF3 filtered.maker.filtered.gff3.Uniprot
$MAKERBIN/maker_functional_fasta $UNIPROT $BLAST_BESTHITS $WORKDIR/blast/maker_proteins.fasta.Uniprot > maker_proteins.filtered.fasta.Uniprot
$MAKERBIN/maker_functional_gff $UNIPROT $BLAST_OUTPUT $WORKDIR/blast/filtered.maker.filtered.gff3.Uniprot > filtered.maker.gff3.Uniprot.gff3

TAIR10_GENEMODEL="/data/courses/assembly-annotation-course/CDS_annotation/data/TAIR10_pep_20110103_representative_gene_model"

blastp -query $MAKERPROTEIN -db $TAIR10_GENEMODEL -num_threads 10 -outfmt 6 -evalue 1e-5 -max_target_seqs 10 -out $WORKDIR/blast/blastp_output_TAIR10/blastp_output_TAIR10.besthits

# Now sort the blast output to keep only the best hit per query sequence
sort -k1,1 -k12,12g $WORKDIR/blast/blastp_output_TAIR10/blastp_output_TAIR10.besthits | sort -u -k1,1 --merge > $WORKDIR/blast/blastp_output_TAIR10.besthits
