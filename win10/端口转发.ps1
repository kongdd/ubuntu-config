## Dongdong Kong, CUG, 20201115
## 本程序用来实现
# 1. 通过中转机端口转发，访问ssh, rstudio-server服务
# 2. 通过VPN实现服务器上网

$PC_middle = 172.27.24.
$PC_remote = 172.16.10.1

$port = 22
New-NetFirewallRule -Protocol TCP -LocalPort $port -Direction Inbound -Action Allow -DisplayName sshd
netsh interface portproxy add v4tov4 listenaddress=$PC_middle listenport=$port connectaddress=$PC_remote connectport=22

$port = 8787
New-NetFirewallRule -Protocol TCP -LocalPort $port -Direction Inbound -Action Allow -DisplayName rstudio-server
netsh interface portproxy add v4tov4 listenaddress=$PC_middle listenport=$port connectaddress=$PC_remote connectport=$port

# netsh interface portproxy delete  v4tov4 listenaddress=$PC_middle listenport=8080

# disp
netsh interface portproxy show all

# 打卡windows端口
# New-NetFirewallRule -Protocol TCP -LocalPort 5938 -Direction Inbound -Action Allow -DisplayName teamviewer
# New-NetFirewallRule -Protocol TCP -LocalPort 22 -Direction Inbound -Action Allow -DisplayName sshd

## 2. 设置通过跳转机VPN联网

# a. 打开防火墙
$port = 1080
New-NetFirewallRule -Protocol TCP -LocalPort $port -Direction Inbound -Action Allow -DisplayName sock5

# b. 设置git与export 
vpn=http://172.16.10.253:1080
git config --global http.proxy ${vpn}
git config --global https.proxy ${vpn}

export http_proxy=${vpn}
export http_proxys=${vpn}

# export http_proxy=socks5://localhost:1080
# export http_proxys=socks5://localhost:1080

# export http_proxy=http://localhost:1080
# export http_proxys=http://localhost:1080

# curl -x http://localhost:1080 https://www.baidu.com
# ss-server -s 0.0.0.0 -p 443 -k passwd -m chacha20 -u
# ss-server -s 0.0.0.0 -p 443 -k passwd -m aes-256-gcm -u
# http_proxy=http://172.16.10.253:1080
# http_proxys=http://172.16.10.253:1080
