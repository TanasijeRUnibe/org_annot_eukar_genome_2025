#!/bin/bash
#SBATCH --job-name=combine_tsv
#SBATCH --partition=pibu_el8 
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G
#SBATCH --time=02:00:00
#SBATCH --output=R_visualizations/logs/%x_%j.out
#SBATCH --error=R_visualizations/logs/%x_%j.err

cd /data/users/trakic/assembly_annotation_course/organisation_annotation_eukaryotic_genomes/results3/EDTA_annotation/hifisam.asm.bp.p_ctg.fa.mod.EDTA.raw

cat LTR/*.cls.tsv \
    LINE/*.cls.tsv \
    SINE/*.cls.tsv \
    TIR/*.cls.tsv \
    Helitron/*.cls.tsv \
    > hifisam.asm.bp.p_ctg.fa.mod.EDTA.all.rexdb.cls.tsv
