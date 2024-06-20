## 服务器节点权限

一定要这样设置，才能看到

```bash
kong:x:1001:1001::/share/home/kong:/usr/bin/bash > /etc/passwd
passwd kong # 设定密码

chmod 700 /share/home/kong/.ssh
chmod 600 /share/home/kong/.ssh/config
chmod 600 /share/home/kong/.ssh/authorized_keys
```
