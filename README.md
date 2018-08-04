# shadowsocks

https://github.com/shadowsocks/shadowsocks-libev

# 1. Install shadowsocks
```bash
sudo apt-get install software-properties-common rng-tools -y
sudo add-apt-repository ppa:max-c-lv/shadowsocks-libev -y
sudo apt-get update
sudo apt install shadowsocks-libev
```

# 2. setup autorun
```bash
sudo vi /etc/rc.local
# copy the following script to rc.local
ss-server -s 0.0.0.0 -p 443 -k passwd -m chacha20 -u
```

# 3. elevate the access of rc.local
```bash
sudo chown root:root /etc/rc.local
sudo chmod 755 /etc/rc.local
sudo systemctl enable rc-local.service
```
