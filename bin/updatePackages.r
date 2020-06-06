#! /usr/bin/Rscript --no-init-file

local({
    r <- getOption("repos")
    r["CRAN"] <- "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"
    options(repos = r)
})
# .libPaths("/mnt/e/WSL/r_library")
update.packages(ask = FALSE)
