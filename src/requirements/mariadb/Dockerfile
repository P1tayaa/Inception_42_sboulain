FROM debian:bullseye

RUN apt-get update -y
RUN apt-get install -y mariadb-server -y
# RUN apt-get install -y mysql-server -y

# COPY setup.sh /
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/

# RUN chmod +x setup.sh


COPY setup.sh /

RUN chmod +x setup.sh


CMD ["/setup.sh"]
