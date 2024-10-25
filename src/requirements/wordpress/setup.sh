#!/bin/bash


mkdir /var/www
mkdir /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i -r "s/MYSQL_DATABASE_NAME/$MYSQL_DATABASE_NAME/1" wp-config.php
sed -i -r "s/MYSQL_USER/$MYSQL_USER/1" wp-config.php
sed -i -r "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/1" wp-config.php

cat wp-config.php

mv wp-config.php /var/www/html/wp-config.php


wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root


wp theme install astra --activate --allow-root

wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/*/fpm/pool.d/www.conf

# cat /etc/php/*/fpm/pool.d/www.conf | grep listen

mkdir /run/php

wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F