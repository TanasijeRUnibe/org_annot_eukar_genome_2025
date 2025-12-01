#!/bin/bash
#SBATCH --time=1-00:00:00
#SBATCH --mem=32G
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=16
#SBATCH --job-name=getlongestPROT
#SBATCH --output=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/final/output_err/%x_%j.e


module load SeqKit/2.6.1

seqkit fx2tab assembly.all.maker.proteins.renamed.filtered.fasta \
| awk -F'\t' '{len=length($2); split($1,a,"-R"); gene=a[1]; if(len>max[gene]){max[gene]=len; seq[gene]=$0}} END{for(i in seq) print seq[i]}' \
| seqkit tab2fx > longest_per_gene_prot.fa
