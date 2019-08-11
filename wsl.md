## 开机启动
```bash
# https://zhuanlan.zhihu.com/p/42933675
ln -fs /lib/systemd/system/rc-local.service /etc/systemd/system/rc-local.service  
touch /etc/rc.local  
chmod 755 /etc/rc.local  
# #!/bin/bash
# service start ....
# exit 0 

vim /etc/sudoers.d/rc-local
kong * = (root) NOPASSWD: /etc/rc.local

# start_wsl.vbs
set ws=wscript.createobject("wscript.shell")
ws.run "C:\Windows\System32\bash.exe -c 'sudo /etc/rc.local'",0
```

## sublime
```bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
# sudo apt-get remove sublime-text && sudo apt-get autoremove
```

<!-- ## anaconda -->
## miniconda

https://gist.github.com/arose13/fcc1d2d5ad67503ba9842ea64f6bac35
https://conda.io/en/latest/miniconda.html

```bash
# Get Miniconda and make it the main Python interpreter
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh
./miniconda.sh -b -p /opt/miniconda 
# rm ~/miniconda.sh
echo "PATH=$PATH:$/opt/miniconda/bin" >> .bashrc

conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
conda config --set show_channel_urls yes
```

## ncl
```bash
conda install -c conda-forge PyNGL PyNIO
conda create -n ncl_notebook -c conda-forge -c ncar ncl=6.4.0 gsl python=3.6 jupyter
```


