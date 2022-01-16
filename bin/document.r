#! /usr/bin/env -S Rscript --no-init-file

# .libPaths("/mnt/e/WSL/r_library")
args <- commandArgs(TRUE)
if (length(args) == 0) args = "."

res <- try(devtools::document(args))
