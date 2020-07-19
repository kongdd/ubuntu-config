```bash
conda update --all

# iptables -I INPUT 1 -i eth0 -p tcp --dport 8080 -j ACCEPT
# iptables -I INPUT 1 -i eth0 -p tcp --dport 8888 -j ACCEPT
iptables -A INPUT -p tcp --dport 8888 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8888 -j ACCEPT

iptables -L INPUT --line-numbers
iptables -D INPUT 1
```

```bash
jupyter notebook --generate-config --allow-root
jupyter notebook password

cat ~/.jupyter/jupyter_notebook_config.json

```

```python
c.NotebookApp.ip='*'
c.NotebookApp.password = u'sha1:6e0c743f1fe8:aeb98d4d13b85ea2bb094a80b84b5eb4ee20fb17'
c.NotebookApp.open_browser = False
c.NotebookApp.port =8888
```

```json
{
  "NotebookApp": {
    "password": "sha1:6e0c743f1fe8:aeb98d4d13b85ea2bb094a80b84b5eb4ee20fb17"
  }
}
```

# 开机启动
```bash
su kongdd -c "jupyter notebook --config=/home/kongdd/.jupyter/jupyter_notebook_config.py --no-browser --notebook-dir=/home/kongdd/notebooks &"
systemctl status rc-local.service
systemctl stop rc-local.service
systemctl start rc-local.service
```

fix ubuntu-desktop error
```bash
sudo /etc/init.d/acpid stop
sudo apt-get purge acpid
```

```bash
# update packages
pip freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs -n1 pip install -U
```

```python
# content
pip install jupyter_nbextens_configurator
pip install jupyter_contrib_nbextensions

jupyter contrib nbextension install --sys-prefix
jupyter nbextensions_configurator enable --user
# jupyter contrib nbextension install --sys-prefix
```


```bash
pip install jupyter-c-kernel
install_c_kernel --sys-prefix


git clone https://github.com/f66blog/jupyter-ifort-kernel
pip install .
jupyter-kernelspec install ifort_spec
```


## 修改镜像

### conda
```bash
# ~\.condarc
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

### pip
```bash
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```


```
code ~/.pip/pip.conf
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```
