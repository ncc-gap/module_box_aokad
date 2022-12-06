## http://rna.recount.bio/docs/quick-access.html#quick-recount3

## Install the recount3 R/Bioconductor package
#if (!requireNamespace("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install("recount3")

## Load recount3 R package
library("recount3")

## Find all available human projects
human_projects <- available_projects()

## Find the project you are interested in,
## here we use SRP009615 as an example
proj_info <- subset(
    human_projects,
    project == "SRP009615" & project_type == "data_sources"
)

## Create a RangedSummarizedExperiment (RSE) object at the gene level
rse_gene_SRP009615 <- create_rse(proj_info)

## Explore that RSE object
rse_gene_SRP009615
