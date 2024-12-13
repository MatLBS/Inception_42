FROM debian:bullseye

RUN apt-get update -y && \
    apt install mariadb-server -y
# mkdir -p /var/lib/mysql && \
# mkdir -p /home/matle-br/data/mariadb

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/start.sh /mariadb-config.sh

RUN chmod -R 777 /mariadb-config.sh

CMD ["/bin/bash", "mariadb-config.sh"]