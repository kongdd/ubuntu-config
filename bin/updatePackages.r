#! /usr/bin/Rscript --no-init-file

server <- "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"
# server <- "https://mirrors.aliyun.com/CRAN/"
local({
    r <- getOption("repos")
    r["CRAN"] <- server
    options(repos = r)
})
# .libPaths("/mnt/e/WSL/r_library")
update.packages(ask = FALSE)
