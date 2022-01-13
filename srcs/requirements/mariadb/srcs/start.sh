#!/bin/bash
openrc default
if [ ! -d /var/lib/mysql/wordpress_db/ ]; then
/etc/init.d/mariadb setup
rc-service mariadb start

echo "CREATE USER 'ajeanett"
echo "DB USER is $DB_USER, DB_PASSWORD is $DB_PASSWORD, DB_NAME is $DB_NAME"
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -u root --skip-password
echo "CREATE DATABASE $DB_NAME"
echo "CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root --skip-password
echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

# mysql wp_base -u root < /wp_base.sql
rc-service mariadb stop
fi
#bash
# bash
mysqld_safe --datadir='/var/lib/mysql' 

# mkdir /var/run/mysqld
# mkfifo var/run/mysqld/mysqld.sock
# touch /var/run/mysqld/mysqld.pid
# chown -R mysql /var/run/mysqld