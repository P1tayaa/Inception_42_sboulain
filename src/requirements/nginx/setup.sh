#!/bin/bash

rm -rf /etc/nginx/sites-available/default.conf

echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    ssl_certificate /etc/nginx/ssl/sboulain.crt;
    ssl_certificate_key /etc/nginx/ssl/sboulain.key;

    # server_name www.$DOMAIN_NAME $DOMAIN_NAME;

    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;" > /etc/nginx/sites-available/default
echo '
    location ~ [^/]\.php(/|$) { 
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}
' >> /etc/nginx/sites-available/default

