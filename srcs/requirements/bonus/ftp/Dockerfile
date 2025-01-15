FROM debian:bullseye

RUN	apt-get update && apt-get upgrade -y
RUN apt install vsftpd -y

COPY /conf/vsftpd.conf /etc/vsftpd.conf
COPY /conf/ftp.sh /ftp.sh

RUN chmod 755 /etc/vsftpd.conf
RUN chmod 755 /ftp.sh

CMD ["/ftp.sh"]