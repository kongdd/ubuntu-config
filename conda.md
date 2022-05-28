
# Conda tsinghua mirror

```bash
# code ~/.condarc
channels:
  - conda-forge
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
channel_priority: strict

# # local_repodata_ttl (bool, int)
# #   For a value of False or 0, always fetch remote repodata (HTTP 304
# #   responses respected). For a value of True or 1, respect the HTTP
# #   Cache-Control max-age header. Any other positive integer values is the
# #   number of seconds to locally cache repodata before checking the remote
# #   server for an update.
# # 
local_repodata_ttl: 3600
```

## pip
```bash
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

# Conda-forge as default

```bash
# https://conda-forge.org/docs/user/introduction.html
conda config --add channels conda-forge
conda config --set channel_priority strict
```

# mamba
```bash
conda install -c conda-forge mamba
```
