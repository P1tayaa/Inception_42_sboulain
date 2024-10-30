FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y nginx
RUN apt-get install -y openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
       -out /etc/nginx/ssl/sboulain.crt \
       -keyout /etc/nginx/ssl/sboulain.key \
       -subj "/C=NL/ST=AMS/L=Amsterdam/O=Codam/OU=sboulain/CN=sboulain/"

# COPY ./conf/nginx.conf /etc/nginx/conf.debian

COPY setup.sh /

RUN chmod +x setup.sh

RUN "/setup.sh"

EXPOSE 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]