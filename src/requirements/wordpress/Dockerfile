FROM debian:bullseye

RUN apt-get update -y && apt-get install -y \
    curl \
    php-fpm php-redis \
    php-mysql wordpress \
    && apt-get clean

RUN chmod 777 /var/www/html \
    && chown -R www-data:www-data /var/www/html \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \ 
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp \
    && wp core download --path=/var/www/html/ --allow-root

COPY ./wp-config.php /

COPY ./setup.sh /

RUN chmod +x setup.sh

CMD ["/setup.sh"]