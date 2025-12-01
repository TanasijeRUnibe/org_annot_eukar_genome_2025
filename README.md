# Assembly & Annotation of Eukaryotic Genomes (2025)
### Accession: RRS10
### Student: Tanasije Rakic

This repository serves as a structured, chronological record of all computational steps performed during the practical course.

This repository contains an extensive collection of Bash and R scripts developed during the *Assembly & Annotation of Eukaryotic Genomes* course (IBU, University of Bern, 2025). The project implements a complete, end‑to‑end workflow that spans transposable element (TE) annotation, structural gene annotation, functional annotation, quality assessment, and comparative genomics. The content has been organized to make the full analysis reproducible, traceable, and logically structured for anyone revisiting the work or adapting it for future projects.

The workflow is divided by week, reflecting the chronological order in which tasks were introduced in the course. Each step includes its own script, supporting files, and standardized naming conventions that ensure clarity and maintainability. The goal of this repository is not just to store scripts, but to document a functional and well‑structured analysis pipeline for eukaryotic genome annotation.

## Repository Structure

### bash_scripts
This directory includes all shell scripts used to automate major stages of the pipeline. The contents are organized in a week‑based sequence and cover tasks such as:
- EDTA execution for full TE annotation, including intact and fragmented elements
- TEsorter classification of LTR retrotransposons into clades and families
- Extraction of full-length LTRs, tools for identity comparison, and TE dynamics visualization
- Complete MAKER-based gene annotation pipeline (input preparation, merging, functional annotation, filtering)
- InterProScan integration for functional domain mapping
- Generation and filtering of Annotation Edit Distance (AED) statistics
- BUSCO analysis for annotation completeness metrics
- Preparation of BED and FASTA files for GENESPACE input
- Execution of GENESPACE analyses, pangenome processing, and multi-genome synteny visualization

Each script includes SLURM headers for cluster execution.

### r_scripts_and_bashlaunchers
This folder contains all R scripts and dedicated launcher scripts used to run analyses on the cluster. These include:
- Scripts for computing LTR identity, identifying recent vs. ancient insertions, and comparing TE dynamics
- Scripts for circos- and circlize-based TE distribution visualization along scaffolds
- R pipelines for RepeatMasker divergence analysis and landscape plotting
- GENESPACE R workflow scripts for orthogroup discovery and synteny inference
- Pangenome matrix processing and summary generation
- Riparian plot scripts for comparing multi-genome syntenic blocks
- Bash wrappers enabling non-interactive R execution on SLURM systems

## Workflow Overview

### Week 1–2: Transposable Element Annotation
- Run EDTA to generate initial TE annotations, including TE libraries, GFF3 files, and RepeatMasker outputs
- Extract Copia and Gypsy sequences, classify them using TEsorter, and generate clade-level TE summaries
- Identify full-length LTR retrotransposons and compute percent identity to estimate insertion age
- Generate TE dynamics plots to characterize recent vs. older insertion events
- Use RepeatMasker outputs to reconstruct TE divergence landscapes using specialized parsing scripts
- Visualize TE density and superfamily distribution using circlize-based circular genome representations
- Produce summary tables comparing TE abundance, distribution patterns, and clade-specific dynamics

### Week 3: Gene Annotation with MAKER
- Merge MAKER GFF and FASTA outputs into unified annotation files
- Assign consistent gene and transcript identifiers using maker_map_ids and associated tools
- Annotate protein sequences using InterProScan, including Pfam domains, GO terms, and IPR signatures
- Compute annotation confidence using AED and integrate AED metrics into the GFF files
- Apply quality filters to remove unsupported, incomplete, or low-confidence predictions
- Extract high-quality mRNA, CDS, and protein sequences for downstream analyses
- Generate final cleaned and functionally annotated gene sets suitable for comparative genomics

### Week 4: Isoforms and Quality Assessment
- Identify longest protein and transcript isoforms per gene to standardize annotation for BUSCO and GENESPACE
- Run BUSCO on proteins or transcripts to assess completeness of the dataset and benchmark annotation quality
- Produce detailed annotation statistics via AGAT, including feature counts, gene model length distributions, and CDS/UTR summaries
- Compare annotation quality across accessions or iterations and verify consistency with expected reference benchmarks

### Week 4–5: Comparative Genomics (GENESPACE)
- Prepare BED and FASTA files compatible with GENESPACE requirements, ensuring correct ordering and ID consistency
- Run DIAMOND BLAST and OrthoFinder-based orthogroup inference through GENESPACE containers
- Produce syntenic dotplots and anchor-hit summaries to assess structural alignment between genomes
- Process the pangenome matrix to identify core, accessory, and unique orthogroups and gene sets
- Generate riparian plots to visualize multi-genome synteny at a structural and chromosomal level
- Summarize comparative genomics results, identifying major differences, conserved blocks, rearrangements, and unique features

## Running on the Cluster

All scripts are adapted to the IBU SLURM cluster environment and rely on Apptainer/Singularity containers. Key behaviors include:
- Standardized SLURM headers defining CPU count, memory requirements, and walltime limits
- Automatic generation of log files stored under `logs/` for output and error tracking
- Reproducible execution using `apptainer exec --bind $WORKDIR container.sif` commands
- Meaningful directory structures that separate `data`, `results`, `logs`, and `scripts` for clarity
- Consistent handling of paths and environment variables to avoid conflicts or unexpected behavior

## Requirements

All major tools required for the pipeline are provided via course containers, including:
- EDTA for TE library construction and TE annotation
- TEsorter for LTR classification
- RepeatMasker for divergence and TE landscape analysis
- MAKER for structural gene prediction
- InterProScan for functional annotation of proteins
- AGAT for GFF/GTF manipulation and annotation statistics
- BUSCO for benchmarking annotation completeness
- GENESPACE for orthology, synteny, and pangenome analysis
- R with tidyverse, circlize, and GENESPACE dependencies for downstream visualization and processing


