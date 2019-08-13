# shadowsocks

https://github.com/shadowsocks/shadowsocks-libev

```bash
# 1. Install shadowsocks
sudo apt-get update \
    && apt install -y --no-install-recommends \
    software-properties-common rng-tools shadowsocks-libev \
    && add-apt-repository ppa:max-c-lv/shadowsocks-libev \
    && apt-get update \
    && apt-get install -y shadowsocks-libev

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
