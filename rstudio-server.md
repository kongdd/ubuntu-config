## R
```bash
# https://cran.r-project.org/bin/linux/ubuntu/README.html
# https://stackoverflow.com/questions/46673717/gpg-cant-connect-to-the-agent-ipc-connect-call-failed
# pkill -9 gpg-agent
# source <(gpg-agent --daemon)

gpg --keyserver keyserver.ubuntu.com --recv-key E298A3A825C0D65DFD57CBB651716619E084DAB9
gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add -

# deb https://mirrors.aliyun.com/CRAN/bin/linux/ubuntu bionic-cran35/
sudo apt-get update
sudo apt-get install r-base

```

## rstudio-server
```bash
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.1335-amd64.deb
sudo gdebi rstudio-server-1.2.1335-amd64.deb
```
