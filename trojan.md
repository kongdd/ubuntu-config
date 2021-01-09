https://www.atrandys.com/2019/1963.html

注意：如果提示SELinux状态问题，请按要求输入Y重启VPS，然后再执行本脚本，否则可能https证书申请出错
卸载掉ubuntu元image

为了启动BBR, 建议使用Debian系统，而非ubuntu1804

```bash
curl -O https://raw.githubusercontent.com/atrandys/trojan/master/trojan_mult.sh && chmod +x trojan_mult.sh && ./trojan_mult.sh

# 2. change password
vim /usr/src/trojan/server.conf

# 3. 另外建议安装bbr，来源于网络分享，以下脚本安装，建议用原版bbr加速，不赘述了
cd /usr/src && wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
# 选择4，使用BBR加速
```

<!-- (1) 安装BBR-plus内核，2
(2) 安装BBR-plus，7 -->
