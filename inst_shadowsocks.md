# shadowsocks

https://github.com/shadowsocks/shadowsocks-libev


```bash
# 1. Install shadowsocks
sudo apt-get update \
    && apt install -y --no-install-recommends \
    software-properties-common rng-tools -y \
    && add-apt-repository ppa:max-c-lv/shadowsocks-libev -y \
    && apt-get update \
    && apt-get install shadowsocks-libev

# 2. setup autorun
sudo rm /etc/rc.local
sudo sh -c 'echo "#!/bin/sh -e" >> /etc/rc.local' \
 && sudo sh -c 'echo "ss-server -s 0.0.0.0 -p 443 -k passwd -m chacha20 -u" >> /etc/rc.local' \
 && sudo sh -c 'echo "exit 0" >> /etc/rc.local'

 # 3. elevate the access of rc.local
sudo chown root:root /etc/rc.local \
    && sudo chmod 755 /etc/rc.local \
    && sudo systemctl enable rc-local.service

```

# 2. docker
### Ubuntu
```bash
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   # "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \

sudo apt-get update
sudo apt-get install docker-ce

# Post-installation 
sudo groupadd docker \
  && usermod -aG docker $USER
```

### Fedora/CentOS/RHEL
```bash
sudo yum remove docker docker-common docker-selinux docker-engine
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
wget -O /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
sudo sed -i 's+download.docker.com+mirrors.tuna.tsinghua.edu.cn/docker-ce+' /etc/yum.repos.d/docker-ce.repo

sudo yum makecache fast
sudo yum install docker-ce
```
