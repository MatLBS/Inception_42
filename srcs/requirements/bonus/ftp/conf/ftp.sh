#!/bin/bash

service vsftpd start

adduser $FTP_USERNAME --disabled-password

echo "$FTP_USERNAME:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null

echo "$FTP_USERNAME" | tee -a /etc/vsftpd.userlist &> /dev/null

mkdir -p /home/$FTP_USERNAME/ftp

chown nobody:nogroup /home/$FTP_USERNAME/ftp
chmod 777 /home/$FTP_USERNAME/ftp

mkdir -p /home/$FTP_USERNAME/ftp/files
chown $FTP_USERNAME:$FTP_USERNAME /home/$FTP_USERNAME/ftp/files

chmod 777 /home/$FTP_USERNAME/ftp/files

service vsftpd stop

/usr/sbin/vsftpd /etc/vsftpd.conf