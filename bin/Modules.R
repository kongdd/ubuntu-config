# gdalwarp -of GTiff -cutline N:/Research/hydro/r_hydro_pkgs/hydroTools/extent_china.shp -cl extent_china -crop_to_cutline -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 O:/水文数据/MERIT_hydro/China/elv.vrt O:/水文数据/MERIT_hydro/China/raster/dem90_merit_china.tif

# library(glue)
.prepend_path <- function(NAME, VALUE){
  vals = Sys.getenv(NAME)
  Sys.setenv(NAME = paste0(VALUE, ":", vals))
}

.prepend_app <- function(root, lib = "/lib") {
  prepend_path("PATH"           , paste0(root, "/bin"))
  prepend_path("INCLUDE"        , paste0(root, "/include"))
  prepend_path("LD_LIBRARY_PATH", paste0(root, lib))
  prepend_path("MANPATH"        , paste0(root, "/share/man"))
}

NETCDF = "/share/base/netcdf-c/4.7.4"
Sys.setenv(NETCDF = NETCDF)
.prepend_app(NETCDF)

gcc = "/share/base/gcc/9.3.0"
.prepend_app(gcc, "/lib64")
# prepend_path("LD_LIBRARY_PATH", "/share/base/gcc/9.3.0/lib64:/opt/anaconda3/lib:/share/intel/2020u1/intelpython3/lib"
# prepend_path("PATH", "/share/base/netcdf-c/4.7.4-gcc930/bin:/share/base/gcc/9.3.0/bin")

# 修改ldpath: 添加gcc
