FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install mariadb-server -y && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    touch /run/mysqld/mysqld.sock

EXPOSE 3306

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/start.sh /mariadb-config.sh

RUN chmod +x /mariadb-config.sh

CMD ["/bin/bash", "mariadb-config.sh"]