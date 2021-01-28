#! /usr/bin/Rscript --no-init-file
# --vanilla

server = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"
# server = "https://mirrors.aliyun.com/CRAN/"
local({
    r <- getOption("repos")
    r["CRAN"] <- server
    options(repos = r)
})
# .libPaths("/mnt/e/WSL/r_library")

args <- commandArgs(TRUE)
# print(sessionInfo())
# print(args)

library(wget)
# destdir <- normalizePath("~/Downloads/r-pkgs/")
destdir <- paste0(dirname(.libPaths()[1]), "/r-pkgs")
if (!dir.exists(destdir)) dir.create(destdir, recursive = TRUE)

res <- try(install.packages(args, destdir = destdir, configure.args = "--use-vanilla", INSTALL_opts = c("--no-test-load")))
# update.packages(ask = FALSE)
# install.packages("xml2", dependencies = TRUE, INSTALL_opts = c("--no-lock"))

# "Lucida Sans", "DejaVu Sans", "Lucida Grande", "Segoe UI", Verdana, Helvetica, sans-serif, serif

# sudo cp /home/php-note/123/* /usr/share/fonts/truetype/windows-font
# sudo chmod -R 777  /usr/share/fonts/truetype/windows-font
# cd /usr/share/fonts/truetype/windows-font
# sudo mkfontscale
# sudo mkfontdir
# sudo fc-cache -fv
# magrittr
