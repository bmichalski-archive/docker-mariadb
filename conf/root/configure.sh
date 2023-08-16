#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

#Allow connection from any IP
sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db
fi

chown -R mysql:mysql /var/lib/mysql
chmod 700 /var/lib/mysql

service mysql start

DEBIAN_SYS_MAINT_PASSWD=`grep '^password =' /etc/mysql/debian.cnf | sed -n 1p | cut -d \  -f 3`

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "GRANT ALL privileges ON *.* TO 'debian-sys-maint'@'localhost' IDENTIFIED BY '$DEBIAN_SYS_MAINT_PASSWD' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

chown -R mysql:mysql /var/lib/mysql
chmod 700 /var/lib/mysql
