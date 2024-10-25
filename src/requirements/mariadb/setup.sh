#!/bin/bash

service mariadb start 

mysql_secure_installation << _EOF_
n
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
n
n
n
n
_EOF_

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$WP_ADMIN_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mariadb -u root -p$MYSQL_ROOT_PASSWORD < db1.sql
rm db1.sql
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
mariadb

# mysql < db1.sql
# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld