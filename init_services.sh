
#备份原软件源
sudo cp /etc/apt/sources.list /etc/apt/sources.list.copy

#新写入软件源
touch /etc/apt/sources.list
echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释" >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse"  >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse"  >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse"  >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse"  >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse"  >> /etc/apt/sources.list
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse"  >> /etc/apt/sources.list

#更新源
sudo apt-get update
sudo apt-get upgrade

#安装服务
sudo apt-get install apache2
sudo service apache2 start

systemctl enable apache2

sudo apt-get install mysql-server mysql-client
touch /etc/rc.d/init.d/autostartmysql.sh
echo "/usr/local/mysql8/bin/mysqld_safe --defaults-file=/usr/local/mysql8/my.cnf &">> /etc/rc.d/init.d/autostartmysql.sh

sudo apt-get install php
php -v

sudo apt-get install libapache2-mod-php php-mysql


#测试

cd /var/www/html

touch info.php
touch info.html

echo "<?php ">> info.php
echo "phpinfo();?>">>info.php

echo "<?php ">> info.html
echo "phpinfo();?>">>info.html

