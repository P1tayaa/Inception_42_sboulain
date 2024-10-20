FROM debian:buster

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt -y update
RUN apt install -y nginx
RUN apt install -y openssl

RUN mkdir /etc/nginx/ssl
# RUN openssl req -newkey

COPY ./conf/nginx.conf /etc/nginx/conf.debian

RUN mkdir -p /run/nginx
EXPOSE 443

CMD [nginx, -g, daemon off;]