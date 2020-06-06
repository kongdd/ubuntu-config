#! /usr/bin/Rscript --no-init-file
# --vanilla

local({
    r <- getOption("repos")
    r["CRAN"] <- "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"
    options(repos = r)
})
# .libPaths("/mnt/e/WSL/r_library")

args <- commandArgs(TRUE)
# print(args)
res <- try(install.packages(args))
# update.packages(ask = FALSE)
# install.packages("xml2", dependencies = TRUE, INSTALL_opts = c("--no-lock"))

# "Lucida Sans", "DejaVu Sans", "Lucida Grande", "Segoe UI", Verdana, Helvetica, sans-serif, serif

# sudo cp /home/php-note/123/* /usr/share/fonts/truetype/windows-font
# sudo chmod -R 777  /usr/share/fonts/truetype/windows-font
# cd /usr/share/fonts/truetype/windows-font
# sudo mkfontscale
# sudo mkfontdir
# sudo fc-cache -fv
