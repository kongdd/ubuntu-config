wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg --configure -a
sudo apt-get install -f

sudo apt update --fix-missing
