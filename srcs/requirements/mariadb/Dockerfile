FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    apt install vim -y
    
EXPOSE 3306
    
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/start.sh /mariadb-config.sh
    
RUN chmod 755 /mariadb-config.sh && \
    chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf
    

ENTRYPOINT ["/mariadb-config.sh"]