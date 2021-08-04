centos7安装proj6和gdal3异常困难，导致很多R包无法在服务器上安装。

解决方法：利用conda自动安装已经编译好的proj, gdal, geos。论conda的妙用。

# 1. conda install gdal
``` bash
# install minconda first
sudo yum install conda
conda create -n qgis
conda activate qgis
conda install gdal proj geos
# qgis: 
# "/share/home/kong/.conda/envs/qgis"
```

# 2. R语言对接

- 实现module load功能
- module load gcc/9.3.0
- module load netcdf-c/4.7.4-gcc930
- module load qgis

```R
.libPaths(c("/share/opt/R/x86_64-pc-linux-gnu-library/4.1"))
# net proxy
.vpn="http://172.16.10.253:1081"
Sys.setenv(http_proxy=.vpn)
Sys.setenv(https_proxy=.vpn)
# git config --global http.proxy ${vpn}
# git config --global https.proxy ${vpn}
#export HTTP_PROXY=${vpn}

.prepend_path <- function(NAME, VALUE, head = FALSE){
  vals = Sys.getenv(NAME)
  vals = if (vals == "") VALUE
  else {
    if (head) paste0(vals, ":", VALUE) else paste0(VALUE, ":", vals)
  }
  cmd = sprintf('Sys.setenv(%s=vals)', NAME)
  eval(parse(text = cmd))
}

.prepend_app <- function(root, lib = "/lib") {
  .prepend_path("PATH"           , paste0(root, "/bin"))
  .prepend_path("INCLUDE"        , paste0(root, "/include"))
  .prepend_path("LD_LIBRARY_PATH", paste0(root, lib))
  .prepend_path("MANPATH"        , paste0(root, "/share/man"))
}

.echo <- function(cmd) {
  system(paste0("echo $", cmd))
}

.prepend_path("PATH", "/opt/julia/julia-1.6.2/bin")
.prepend_path("INCLUDE", "/usr/include")
# .prepend_app("/usr", "/lib64")
Sys.setenv(LD_LIBRARY_PATH = "/opt/R/4.1.0/lib/R/lib") # :/usr/local/lib/

## add gcc and NetCDF
.prepend_app("/share/base/gcc/9.3.0", "/lib64")
.NETCDF = "/share/base/netcdf-c/4.7.4-gcc930"

Sys.setenv(NETCDF = .NETCDF)
.prepend_app(.NETCDF)

## conda qgis
# pkgconfig help to find lib
Sys.setenv("PKG_CONFIG_PATH" = "/share/home/kong/.conda/envs/qgis/lib/pkgconfig")
.prepend_path("PATH", "/share/home/kong/.conda/envs/qgis/bin", head = TRUE)
.prepend_app("/share/home/kong/.conda/envs/qgis") # add qgis
```

# 3. rstudio-server对接

```bash
## cat /etc/rstudio/rserver.conf 
# R Session Configuration File
rsession-which-r=/opt/R/4.1.0/lib/R/bin/R
rsession-ld-library-path=/share/home/kong/.conda/envs/qgis/lib
```

# 安装包测试
```r
install.packages("rgdal")
install.packages("sf")
install.packages("terra")
```
