---
output: 
  html_document: 
    css: css_wechat.css
---

# CentOS-7 rstudio-server环境配置

> centos7很多包不提供最新版，手动编译proj6和gdal3又异常困难，导致很多R包无法在服 务器上安装如(terra, ssh等)。但借助conda，可以自动安装已经编译好的proj, gdal, geos, ssh，具体教程如下：论conda的妙用。

# 1. conda install gdal

``` {.bash}
# install minconda first
sudo yum install conda
conda create -n qgis
conda activate qgis
conda install gdal proj geos
# qgis: move to "/share/opt/.conda/envs/qgis"
```

# 2. 设置动态链接库路径`LD_LIBRARY_PATH`

R语言启动后再设置`LD_LIBRARY_PATH`，安装包编译时有效，但是安装包加载时无效。**环境变量`LD_LIBRARY_PATH`需要在R语言启动之前就进行设置，才能真正生效。**

## 2.1 `rstudio-server`启动环境设置

``` {.bash}
## sudo vim /etc/rstudio/rserver.conf 
# R Session Configuration File
rsession-which-r=/opt/R/4.1.0/lib/R/bin/R
rsession-ld-library-path=/share/opt/.conda/envs/qgis/lib
```

通过上面的设置，在rstudio-server中可以正常使用conda的动态链接库。但是通过terminal打开R语言时，加载包却会失败。 因此还需要进行3.2的设置。

## 2.2 `R语言`启动环境设置

``` {.bash}
# sudo vim /opt/R/4.1.0/lib/R/etc/ldpath
# 数最后一行修改前面添加`LD_LIBRARY_PATH`的路径（bash语法）：
LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/share/opt/.conda/envs/qgis/lib:/share/base/gcc/9.3.0/lib64"
export LD_LIBRARY_PATH
```

# 3. 编译环境设置

R语言中无法找到`module load`的路径，因此手动造了一个R语言版的`module load`。

-   实现module load功能
-   module load gcc/9.3.0
-   module load netcdf-c/4.7.4-gcc930
-   module load qgis

安装ncdf4, rgdal, sf, terra等，这些环境变量需要正确配置。

``` {.r}
.libPaths(c("/share/opt/R/x86_64-pc-linux-gnu-library/4.1"))
# net proxy
.vpn="http://**.16.10.***:1081" # 网络代理
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
.path_conda = "/share/home/kong/.conda/envs/qgis"
Sys.setenv("PKG_CONFIG_PATH" = paste0(.path_conda, "/lib/pkgconfig"))
.prepend_app(.path_conda) # add qgis
```

# 4. 安装包测试

``` {.r}
install.packages("rgdal")
install.packages("sf")
install.packages("terra")
install.packages("ssh")
```

至此上述安装包可以全部正常安装和加载。因此可以得出结论，R语言可以跳过系统库，直接加载conda的动态链接库，免去了手动编译安装包的麻烦。
