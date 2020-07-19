#! /usr/bin/Rscript --no-init-file

# .libPaths("/mnt/e/WSL/r_library")
args <- commandArgs(TRUE)
# print(args)
res <- try(devtools::document(args))
