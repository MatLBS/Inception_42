FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install mariadb-server mariadb-client -y && \
    chown mysql.mysql -R /var/lib/mysql && \
    chmod 750 -R /var/lib/mysql
    # chown -R mysql:root /etc/mysql && \
    # chmod -R 755 /etc/mysql
    # chown -R mysql:mysql /var/lib/mysql && \
    # chmod 755 -R /var/lib/mysql

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/start.sh /mariadb-config.sh

RUN chmod 755 /mariadb-config.sh && \
    chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /mariadb-config.sh

CMD ["/bin/bash", "/mariadb-config.sh"]