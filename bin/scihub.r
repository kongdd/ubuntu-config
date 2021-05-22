#! /usr/bin/Rscript --no-init-file

args <- commandArgs(TRUE)
for (doi in args) {
    tryCatch({
        rscihub::scihub(doi)
    }, error = function(e) {
        message(sprintf('%s', e$message))
    })
}
