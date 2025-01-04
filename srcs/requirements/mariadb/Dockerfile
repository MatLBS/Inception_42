FROM debian:bullseye

RUN apt-get update -y && \
    apt install mariadb-server -y && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

EXPOSE 3306

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/start.sh /mariadb-config.sh

RUN chmod -R 777 /mariadb-config.sh

CMD ["/bin/bash", "mariadb-config.sh"]