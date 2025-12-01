#!/usr/bin/env Rscript
library(GENESPACE)

args <- commandArgs(trailingOnly = TRUE)
wd <- args[1]

# Load pangenome matrix
p <- readRDS(file.path(wd, "pangenome_matrix.rds"))

# Convert to data.frame (IMPORTANT FIX)
p <- as.data.frame(p)

cat("\n=== Loaded pangenome matrix ===\n")
print(names(p))
cat("\n")

############################################################
# 1. Identify genomes
############################################################
genomes <- c("Are_6", "Etna_2", "Ice_1", "RRS10", "TAIR10")

############################################################
# 2. Core / accessory / unique orthogroups
############################################################

# Presence/absence matrix (only genome columns)
presmat <- as.matrix(p[, genomes])

# Core OGs (present in all)
core_mask <- apply(presmat, 1, function(x) all(x == 1))
core_ogs <- unique(p$og[core_mask])

# Accessory OGs (>1 but <all)
accessory_mask <- apply(presmat, 1, function(x) sum(x) > 1 & sum(x) < length(genomes))
accessory_ogs <- unique(p$og[accessory_mask])

# Unique OGs (present in exactly one genome)
unique_mask <- apply(presmat, 1, function(x) sum(x) == 1)
unique_ogs <- unique(p$og[unique_mask])

cat("=== Orthogroup Summary ===\n")
cat("Core orthogroups:      ", length(core_ogs), "\n")
cat("Accessory orthogroups: ", length(accessory_ogs), "\n")
cat("Unique orthogroups:    ", length(unique_ogs), "\n\n")

############################################################
# 3. Unique genes per genome
############################################################

# rowSums == 1 → orthogroup is unique to one genome
unique_gene_counts <- colSums(presmat == 1 & rowSums(presmat) == 1)

cat("=== Unique genes per genome ===\n")
print(unique_gene_counts)
cat("\n")

############################################################
# 4. Summary table per genome
############################################################

summary_table <- data.frame(
  genome = genomes,
  core = colSums(presmat[core_mask, , drop=FALSE]),
  accessory = colSums(presmat[accessory_mask, , drop=FALSE]),
  unique = colSums(presmat[unique_mask, , drop=FALSE]),
  total_genes = colSums(presmat)
)

cat("=== Summary per genome ===\n")
print(summary_table)
cat("\n")

############################################################
# 5. Save outputs
############################################################

write.csv(unique_gene_counts,
          file.path(wd, "unique_genes_per_genome.csv"))
write.csv(presmat,
          file.path(wd, "orthogroup_presence_absence_matrix.csv"))
write.csv(summary_table,
          file.path(wd, "orthogroup_summary_per_genome.csv"))

cat("=== Output saved successfully ===\n")
