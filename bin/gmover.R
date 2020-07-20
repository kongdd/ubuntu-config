#! /usr/bin/Rscript --no-init-file
# tmux
# ~/.gdrive_mover.R

library(googledrive)
library(foreach)
library(iterators)

indirs  = c(
    "/mnt/c/Users/kongdd/Google 云端硬盘（kjding93@gmail.com）/MODIS", 
    "/mnt/c/Users/kongdd/Google 云端硬盘（cuijian426@gmail.com）/MODIS", 
    "/mnt/c/Users/kongdd/Google 云端硬盘（kongdd.sysu@gmail.com）/MODIS")
outdir = "/mnt/f/Terra_LAI"

list_files <- function(dirs, pattern = "*.tif") {
    foreach(indir = dirs, i = icount(), .combine = c) %do% {
        dir(indir, pattern, full.names = TRUE)
    }
}

empty_trash <- function() {
    drive_empty_trash()
    # get_used()
    info = drive_about()$storageQuota
    used = as.numeric(info$usage) / 1024^3
    cat(sprintf("[info] used: %.2f Gb\n", used))    
}

i = 0
mover <- function(indir, outdir) {
    print(Sys.time())
    
    files_in = list_files(indirs)
    if (length(files_in) > 0) {
        foreach(infile = files_in, i = icount()) %do% {
            tryCatch({
                outfile = paste0(outdir, "/", basename(infile))
                cmd     = sprintf('mv "%s" "%s"', infile, outfile)
                status  = system(cmd, wait = FALSE)
                # print(cmd)
                # if (status == 0) {
                #     file.rename(infile, outfile)
                #     drive_rm(basename(infile))
                # }
            }, error = function(e) {
                message(sprintf('%s', e))
            })
        }
        empty_trash()
    }
    if (i %% 10 == 0) empty_trash()
    i <<- i + 1
    invisible()
}

while(1) {
    # print("hello")
    tryCatch({
        mover(indir, outdir)
    }, error = function(e) {
        message(sprintf('[e]: %s', e$message))
    })
    Sys.sleep(20)
}
