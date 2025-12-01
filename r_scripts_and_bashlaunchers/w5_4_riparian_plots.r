#!/usr/bin/env Rscript
library(GENESPACE)

args <- commandArgs(trailingOnly = TRUE)
wd <- args[1]

cat("=== Initializing GENESPACE project ===\n")

gpar <- init_genespace(
  wd = wd,
  path2mcscanx = "/usr/local/bin"
)

cat("=== Running GENESPACE (cached) ===\n")

gs <- run_genespace(
  gsParam = gpar,
  overwrite = FALSE
)

cat("=== GENESPACE loaded ===\n")

invchr <- data.frame(
  genome = rep("RRS10", 8),
  chr = c(
    "ptg000006l", "ptg000007l", "ptg000014l",
    "ptg000001l", "ptg000004l", "ptg000005l",
    "ptg000002l", "ptg000013l"
  ),
  stringsAsFactors = FALSE
)

cat("=== Generating riparian data ===\n")

ripDat <- plot_riparian(
  gsParam = gs,
  refGenome = "TAIR10",
  invertTheseChrs = invchr,
  reorderBySynteny = TRUE,
  minChrLen2plot = 10,
  chrLabFontSize = 7
)

cat("=== Saving PDF ===\n")

outfile <- file.path(wd, "riparian_plot.pdf")
pdf(outfile, width = 16, height = 12)

# THIS IS THE CORRECT WAY TO PLOT:
print(ripDat$gg)

dev.off()

cat("=== Riparian plot saved to ", outfile, " ===\n")
