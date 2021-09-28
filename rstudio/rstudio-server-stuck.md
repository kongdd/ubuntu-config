
# rstudio-server卡死抢救方案

```bash
# kong login
sudo su
ssh c001
rstudio-server stop
rstudio-server start

cd /tmp
rm * -rf
rm -rf /share/home/kong01/.local/share/rstudio

killall -u kong01 -9
```
