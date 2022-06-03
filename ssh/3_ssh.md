# Ubuntu系统中

## 1.1 安装openssh-server
```bash
sudo apt-get install openssh-server
# service sshd restart
sudo service ssh restart
sudo service ssh --full-restart
```

## 1.2 修改Ubuntu设置
```bash
# sudo vim /etc/ssh/sshd_config

X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes
PasswordAuthentication yes

xauth list # check 

# sudo xauth add localhost/unix:10 MIT-MAGIC-COOKIE-1 27e035688dd89483c6fe48b2470172f5
# /usr/bin/xauth:  /home/kong/.Xauthority not writable, changes will be ignored
# https://unix.stackexchange.com/questions/215558/why-am-i-getting-this-message-from-xauth-timeout-in-locking-authority-file-ho
sudo rm .Xauthority*
```

# 2. windows系统中

```powershell
# ~/.ssh/config
Host *
    User kong
    ForwardAgent yes
    ForwardX11 yes
    ForwardX11Trusted yes
    XauthLocation /usr/bin/xauth
    LogLevel ERROR
Host work
    HostName ecohydro.top
    Port 23
```

```powershell
function ssh-copy-id([string]$userAtMachine){   
    $publicKey = "$ENV:USERPROFILE" + "/.ssh/id_rsa.pub"
    if (!(Test-Path "$publicKey")){
        Write-Error "ERROR: failed to open ID file '$publicKey': No such file"            
    }
    else {
        & cat "$publicKey" | ssh $userAtMachine "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys || exit 1"      
    }
}
ssh work
```

```powershell
# 添加 DISPLAY 到环境变量(用户变量即可)；
# localhost不能省略；
$env:DISPLAY="localhost:0.0"
ssh work
```

# 3. 测试是否成功
```bash
ssh -Y kongdd@server_ip xeyes
```

## 结论
(1) 配合win x410 图形界面看起来像是原生，
(2) 但是ssh x11速度较慢，不适合采用sublime进行编辑
(3) sublime merge in x11太卡，不适合远程使用
