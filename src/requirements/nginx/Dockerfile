FROM debian:buster

RUN apt -y update
RUN apt install -y nginx
RUN apt install -y openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/sboulain.crt \
       -keyout /etc/nginx/ssl/sboulain.key \
       -subj "/C=NL/ST=Amsterdam/L=Amsterdam/O=Codam/OU=sboulain/CN=sboulain/"

COPY ./conf/nginx.conf /etc/nginx/conf.debian

RUN mkdir -p /run/nginx
EXPOSE 443

CMD [nginx, -g, daemon off;]