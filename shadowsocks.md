# shadowsocks

https://github.com/shadowsocks/shadowsocks-libev

```bash
# 1. Install shadowsocks
# && add-apt-repository ppa:max-c-lv/shadowsocks-libev \
sudo apt-get update \
    && apt install -y --no-install-recommends \
    software-properties-common rng-tools shadowsocks-libev \
    && apt-get update \
    && apt-get install -y shadowsocks-libev

# 2. setup autorun
sudo rm /etc/rc.local
sudo sh -c 'echo "#!/bin/sh -e" >> /etc/rc.local' \
 && sudo sh -c 'echo "ss-server -s 0.0.0.0 -p 443 -k passwd -m chacha20 -u" >> /etc/rc.local' \
 && sudo sh -c 'echo "exit 0" >> /etc/rc.local'

# su kongdd -c "jupyter notebook --config=/home/kongdd/.jupyter/jupyter_notebook_config.py --no-browser --notebook-dir=/home/kongdd/notebooks &"
# systemctl status rc-local.service
# systemctl stop rc-local.service
# systemctl start rc-local.service

# 3. elevate the access of rc.local
sudo chown root:root /etc/rc.local \
    && sudo chmod 755 /etc/rc.local \
    && sudo systemctl enable rc-local.service \
    && sudo systemctl start rc-local.service
```

```bash
# 可能是需要输入密码的原因，导致wsl rc.local无法运行
sudo visudo

#includedir /etc/sudoers.d
%sudo ALL=NOPASSWD: /usr/sbin/sshd
%sudo ALL=NOPASSWD: /usr/sbin/service
%sudo ALL=NOPASSWD: /etc/rc.local
```

```vb
' start_wsl.vbs
set ws=wscript.createobject("wscript.shell")
' ws.run "C:\Windows\System32\bash.exe -c 'sudo /etc/init.d/rstudio-server start'",0
ws.run "C:\Windows\System32\bash.exe -c 'sudo service ssh start'",0
' ws.run "C:\Windows\System32\bash.exe -c 'sudo /usr/sbin/sshd'",0
```
