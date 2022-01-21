#! /usr/bin/env -S Rscript --no-init-file
# .libPaths() # check whether the library is correct
# print(sessionInfo())

server <- "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"
# server <- "https://mirrors.aliyun.com/CRAN/"
local({
    r <- getOption("repos")
    r["CRAN"] <- server
    options(repos = r)
})

args <- commandArgs(TRUE)
# print(args)
# destdir <- normalizePath("~/Downloads/r-pkgs/")
destdir <- paste0(dirname(.libPaths()[1]), "/r-pkgs")
if (!dir.exists(destdir)) dir.create(destdir, recursive = TRUE)

if (!require(wget)) {
    devtools::install_github("rpkgs/wget", destdir = destdir)
}

# .libPaths("/mnt/e/WSL/r_library")
libs = .libPaths()
# linux: install to the system library
# windows: install to the system library
lib = ifelse(.Platform$OS.type == "windows", libs[1], libs[length(libs)])

# res <- try(devtools::install_github(args, destdir = destdir))
pak::pkg_install(args, lib, upgrade = FALSE) # , dependencies = FALSE, upgrade = TRUE
