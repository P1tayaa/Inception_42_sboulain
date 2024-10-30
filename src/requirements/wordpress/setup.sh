#!/bin/bash

ping_mariadb_container() {
  nc -zv mariadb 3306 >/dev/null # ping the mariadb container
  return $?                      # return the exit status of the ping command
}

mkdir /var/www
mkdir /var/www/html

rm -rf /var/www/html/*
# mv wp-config.php /var/www/html/wp-config.php
cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

while [ 0 -eq 0 ]; do
  ping_mariadb_container
  if [ $? -eq 0 ]; then
    echo "mariadb is online"
    break
  else
    echo "waiting..."
    sleep 1
  fi
done

# sed -i "s/MYSQL_DATABASE_NAME/$MYSQL_DATABASE_NAME/1" wp-config.php
# sed -i "s/MYSQL_USER/$MYSQL_USER/1" wp-config.php
# sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/1" wp-config.php

# pwd
# sleep 5
# wp config create --dbname=$MYSQL_DATABASE_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
# sleep 5

if [ ! -f "/var/www/html/wp-config.php" ]; then
  echo "making wp-config"
  wp core download --path="/var/www/html" --allow-root
  echo "[CREATING WP CONFIG]"
  wp core config --path="/var/www/html" --dbhost=mariadb:3306 --dbname="$MYSQL_DATABASE_NAME" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root
  echo "[CREATING WP CORE]"
  wp core install --path="/var/www/html" --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
  echo "[CREATING WP USER]"
  wp user create --path="/var/www/html" $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root
else
  echo "already-wp-config"
fi
cat wp-config.php

# wp theme install astra --activate --allow-root

# wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/*/fpm/pool.d/www.conf

# cat /etc/php/*/fpm/pool.d/www.conf | grep listen

mkdir -p /run/php

# wp redis enable --allow-root

# service php7.4-fpm stop

exec /usr/sbin/php-fpm7.4 -F
