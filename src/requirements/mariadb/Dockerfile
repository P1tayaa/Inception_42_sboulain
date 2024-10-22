FROM debian:bullseye

RUN apt update -y
RUN apt install -y mariadb-server -y

# COPY setup.sh /
COPY sql.conf /etc/mysql/mariadb.conf.d/

# RUN chmod +x setup.sh


COPY setup.sh /

RUN chmod +x setup.sh


CMD ["/setup.sh"]