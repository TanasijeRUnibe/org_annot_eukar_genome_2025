# Eukaryotic Genome Annotation Project (2025)

This repository contains all Bash and R scripts used for the *Assembly & Annotation of Eukaryotic Genomes* course (IBU, University of Bern, 2025). The project implements the full workflow from transposable element (TE) annotation to gene annotation, quality assessment, comparative genomics, and pangenome analysis.

All scripts are organized by week and step, following the course practical layout.

## Repository Structure

### bash_scripts
Contains workflow steps for:

EDTA, TEsorter, LTR identity, TE dynamics

MAKER gene annotation pipeline

InterProScan integration

AED calculation and GFF/FASTA filtering

BUSCO completeness assessment

BED/FASTA preparation for GENESPACE

GENESPACE execution, pangenome and riparian plots

### r_scripts_and_bashlaunchers
Contains:

R scripts for LTR identity, TE distribution, TE dynamics

R scripts for GENESPACE and pangenome processing

Riparian plot scripts

Bash launchers for cluster execution of R steps

## Workflow Overview

### Week 1–2: Transposable Element Annotation

Run EDTA for genome-wide TE annotation

Classify LTR retrotransposons using TEsorter

Extract full-length LTRs and compute percent identity

Generate TE dynamics plots and RepeatMasker divergence landscapes

Visualize TE distribution across scaffolds using circlize

Produce TE superfamily and clade-level summaries

### Week 3: Gene Annotation with MAKER

Merge MAKER GFF and FASTA outputs

Assign consistent IDs to genes and transcripts

Annotate proteins using InterProScan

Calculate Annotation Edit Distance (AED)

Filter low-quality annotations

Extract high-confidence mRNA, CDS, and protein sequences

Generate final cleaned annotation sets

### Week 4: Isoforms and Quality Assessment

Extract longest protein and transcript isoforms per gene

Run BUSCO to evaluate annotation completeness

Generate annotation statistics with AGAT

### Week 4–5: Comparative Genomics (GENESPACE)

Prepare BED and peptide FASTA files for orthogroup inference

Run DIAMOND BLAST and GENESPACE

Generate syntenic dotplots and synteny-hit maps

Process pangenome matrix

Identify core, accessory, and unique gene sets

Produce riparian plots for multi-species synteny visualization

## Running on the Cluster

All scripts are written for the IBU SLURM cluster and use Apptainer/Singularity containers.

Typical features include:

SLURM headers for CPU, RAM, and time

Logging to logs/

Execution via apptainer exec --bind $WORKDIR container.sif

Reproducible directory structure

## Requirements

All tools are provided through the course containers, including:

EDTA

TEsorter

RepeatMasker

MAKER

InterProScan

AGAT

BUSCO

GENESPACE

R (tidyverse, circlize, GENESPACE dependencies)

## Purpose

This repository serves as:

A complete end-to-end genome annotation pipeline

A record of all steps performed during the course

A standardized and organized script collection

A reproducible resource for similar genomic analyses

A reference for future benchmarking and comparative genomics projects

## Credits

Created for the *Assembly & Annotation of Eukaryotic Genomes* course (2025).
