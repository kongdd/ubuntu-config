#! /usr/bin/env -S Rscript --no-init-file

server = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"
# server = "https://mirrors.aliyun.com/CRAN/"
local({
    r <- getOption("repos")
    r["CRAN"] <- server
    options(repos = r)
})
# .libPaths("/mnt/e/WSL/r_library")

args <- commandArgs(TRUE)
if (length(args) == 0) args = "."

# x = .libPaths() 
# .libPaths(c("~/R/win-library/4.0", .libPaths()))
# print(.libPaths())

destdir <- paste0(dirname(.libPaths()[1]), "/r-pkgs")
if (!dir.exists(destdir)) dir.create(destdir, recursive = TRUE)

if (!require(wget)) {
    devtools::install_github("rpkgs/wget", destdir = destdir)
}
# destdir <- normalizePath("~/Downloads/r-pkgs/")
# print(args)
res <- try(devtools::install(args, dependencies = FALSE))
