FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
# RUN openssl req -newkey

COPY ./conf/nginx.conf /etc/nginx/conf.debian

RUN mkdir -p /run/nginx
EXPOSE 443

CMD [nginx, -g, daemon off;]