```bash

sudo apt-get install gdebi-core

wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2022.02.2-485-amd64.deb
sudo gdebi rstudio-2022.02.2-485-amd64.deb
# wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2022.02.2-485-amd64.deb
# sudo gdebi rstudio-server-2022.02.2-485-amd64.deb

## help rstudio find where is R
ln -s /opt/miniconda3/envs/r-4.2/bin/R /usr/bin/R
```