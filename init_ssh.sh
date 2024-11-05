#重装ssh
sudo apt-get remove openssh-server
sudo apt-get install openssh-server

#修改ssh配置
sudo vim /etc/ssh/sshd_config
#Port 22
#PermitRootLogin Yes
#PasswordAuthentication Yes

sudo vim /etc/hosts.allow
#sshd:ALL

#重启ssh
sudo service ssh --full-restart

#查看ip
ifconfig
