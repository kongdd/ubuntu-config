## 修改`sshd_config`设置

```bash
# vi /etc/ssh/sshd_config
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes

PasswordAuthentication yes

# service sshd restart
sudo service ssh restart
sudo service ssh --full-restart
xauth list # check 

# sudo xauth add localhost/unix:10 MIT-MAGIC-COOKIE-1 27e035688dd89483c6fe48b2470172f5
# /usr/bin/xauth:  /home/kong/.Xauthority not writable, changes will be ignored
# https://unix.stackexchange.com/questions/215558/why-am-i-getting-this-message-from-xauth-timeout-in-locking-authority-file-ho
sudo rm .Xauthority*
```

## special setting for openssh in `powershell`
```powershell
# 添加 DISPLAY 到环境变量(用户变量即可)
$env:DISPLAY="localhost:0.0"
```

## 测试是否成功
```bash
ssh -Y kongdd@server_ip xeyes
```

## 结论
(1) 配合win x410 图形界面看起来像是原生，
(2) 但是ssh x11速度较慢，不适合采用sublime进行编辑
