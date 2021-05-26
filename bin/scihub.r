#! /usr/bin/Rscript --no-init-file
library(magrittr)
args <- commandArgs(TRUE)

for (doi in args) {
    rscihub::scihub(doi)
}
