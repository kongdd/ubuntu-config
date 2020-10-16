

url_root=http://mirrors.aliyun.com/deepin/pool/non-free/d
# mkdir -p ~/temp && cd ~/temp
# 下载环境库的包

version_wine=2.18-22~rc0

aria2c -c ${url_root}/deepin-wine/deepin-wine-binfmt_2.18-22~rc0_all.deb
aria2c -c ${url_root}/deepin-wine/deepin-wine_${version_wine}_all.deb
aria2c -c ${url_root}/deepin-wine/deepin-wine32_${version_wine}_i386.deb
aria2c -c ${url_root}/deepin-wine/deepin-wine32-preloader_${version_wine}_i386.deb
aria2c -c ${url_root}/deepin-wine/deepin-fonts-wine_${version_wine}_all.deb
aria2c -c ${url_root}/deepin-wine/deepin-libwine_${version_wine}_i386.deb
aria2c -c ${url_root}/deepin-wine/deepin-libwine-dbg_${version_wine}_i386.deb
aria2c -c ${url_root}/deepin-wine/deepin-libwine-dev_${version_wine}_i386.deb

aria2c -c ${url_root}/deepin-wine-helper/deepin-wine-helper_1.2deepin8_i386.deb
aria2c -c ${url_root}/deepin-wine-plugin/deepin-wine-plugin_1.0deepin2_amd64.deb
aria2c -c ${url_root}/deepin-wine-plugin/deepin-wine-plugin_1.0deepin2_i386.deb
aria2c -c ${url_root}/deepin-wine-plugin-virtual/deepin-wine-plugin-virtual_1.0deepin3_all.deb
aria2c -c ${url_root}/deepin-wine-uninstaller/deepin-wine-uninstaller_0.1deepin2_i386.deb

## error lists
aria2c -c ${url_root}/udis86/udis86_1.72-2_i386.deb

# aria2c -c https://mirrors.aliyun.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_amd64.deb
# aria2c -c https://mirrors.aliyun.com/deepin/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.5.1-2_i386.deb

# '添加32位支持'
# sudo dpkg --add-architecture i386

