## git 基础设置

```bash
# /usr/bin/ssh-keygen -A
# sudo service ssh --full-restart
ssh-keygen -C kongdd
ssh-copy-id -i ~/.ssh/id_rsa.pub kong@remoteIP
ssh -T git@github.com

# windows format
git config --global core.safecrlf false
git config --global core.autocrlf true

# line ending maters
git config --global core.safecrlf true
git config --global core.autocrlf false
## transform line ending for windows
# git config --global core.autocrlf true

git config --global user.name "Dongdong Kong"
git config --global user.email "kongdd@users.noreply.github.com"
## 记录用户名
git config --global credential.helper store
git config --list --global
# git config --global --unset credential.helper
```


# commits
```bash
git merge -X theirs master

# https://stackoverflow.com/questions/2862590/how-to-replace-master-branch-in-git-entirely-from-another-branch
git branch -m master old-master
git branch -m check_curvefit master
git push -f origin master
```

# hub
```BASH
# https://hub.github.com/hub.1.html
git config --global hub.protocol https
```
