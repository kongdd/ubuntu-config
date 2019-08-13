## git 基础设置

```bash
ssh-keygen -C kongdd
ssh -T git@github.com

git config --global core.safecrlf false
git config --global core.autocrlf true
```

----------
## git代理
```bash
git config --global http.proxy http://127.0.0.1:1080
git config --global https.proxy http://127.0.0.1:1080
git config --global http.proxy 'socks5://127.0.0.1:1080' 
```

## 取消代理
```bash
git config --global --unset http.proxy
git config --global --unset https.proxy
```

## cmd 代理
```batch
set http_proxy=http://127.0.0.1:1080
set https_proxy=http://127.0.0.1:1080
```

# commits
```bash
git merge -X theirs master

# https://stackoverflow.com/questions/2862590/how-to-replace-master-branch-in-git-entirely-from-another-branch
git branch -m master old-master
git branch -m check_curvefit master
git push -f origin master
```
