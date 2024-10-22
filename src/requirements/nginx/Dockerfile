FROM debian:bullseye

RUN apt-get -y update
RUN apt-get install -y nginx
RUN apt-get install -y openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/sboulain.crt \
       -keyout /etc/nginx/ssl/sboulain.key \
       -subj "/C=NL/ST=Amsterdam/L=Amsterdam/O=Codam/OU=sboulain/CN=sboulain/"

# COPY ./conf/nginx.conf /etc/nginx/conf.debian

EXPOSE 443
COPY setup.sh /

RUN chmod +x setup.sh

CMD ["/setup.sh"]