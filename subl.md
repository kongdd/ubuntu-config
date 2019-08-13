```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - \
 && echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list \
 && sudo apt update \
 && sudo apt install sublime-text sublime-merge -y
```
