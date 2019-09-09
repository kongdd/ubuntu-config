## R
```bash
# https://cran.r-project.org/bin/linux/ubuntu/README.html
# https://stackoverflow.com/questions/46673717/gpg-cant-connect-to-the-agent-ipc-connect-call-failed
# pkill -9 gpg-agent
# source <(gpg-agent --daemon)

gpg --keyserver keyserver.ubuntu.com --recv-key E298A3A825C0D65DFD57CBB651716619E084DAB9
gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add -

deb https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu/ bionic-cran35/
# deb https://mirrors.aliyun.com/CRAN/bin/linux/ubuntu bionic-cran35/
sudo apt-get update
sudo apt-get install r-base

```

## rstudio-server
```bash
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.1335-amd64.deb
sudo gdebi rstudio-server-1.2.1335-amd64.deb
```

## add a new user
```bash
sudo su
user=kong
adduser $user
usermod -aG sudo $user
su - $user
sudo passwd

# https://linuxize.com/post/how-to-change-hostname-on-ubuntu-18-04/
sudo hostnamectl set-hostname $user
```

## 开机启动
```bash
# /etc/rc.local
sudo rm /etc/rc.local
sudo sh -c 'echo "#!/bin/sh -e" >> /etc/rc.local' \
 && sudo sh -c 'echo " rstudio-server start" >> /etc/rc.local' \
 && sudo sh -c 'echo "exit 0" >> /etc/rc.local'

 # 3. elevate the access of rc.local
sudo chown root:root /etc/rc.local \
    && sudo chmod 755 /etc/rc.local \
    && sudo systemctl enable rc-local.service
```

### configure `Rmarkdown`
``` r
tinytex::install_tinytex(repo='http://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet')
```
