# sudo adduser
# sudo usermod -a -G kong kong01 
# sudo usermod -a -G sudo kong01 
# sudo umount /mnt/z
# sudo umount /mnt/x
# sudo umount /mnt/o

pwd=""
options="rw,file_mode=0775,dir_mode=0775,uid=1000,gid=1000,username=kong,password=$pwd,iocharset=utf8"

sudo mount -t cifs -o $options //192.168.10.2/CMIP6 /mnt/z
sudo mount -t cifs -o $options //192.168.10.2/GitHub /mnt/x
sudo mount -t cifs -o $options //192.168.10.2/CUG-hydro /mnt/o
# sudo mount -t cifs -o $options //192.168.10.2/CMIP6 /mnt/o
# sudo mount -t cifs -o $options //192.168.10.2/CMIP6 /mnt/i
# mount -t drvfs O: /mnt/o