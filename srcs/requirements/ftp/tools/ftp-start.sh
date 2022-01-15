#!/bin/bash
sleep 12

adduser -D 'ajeanett'; echo "ajeanett:superpassword" | chpasswd
echo 'root:root' | chpasswd
echo "ajeanett" >> /etc/vsftpd/vsftp.userlist

openssl req -x509 -nodes -days 90 -newkey rsa:2048 \
	-subj "/C=ru/ST=Kazan/L=Kazan/O=School21/OU=School21/CN=ajeanette/" \
	-keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem && \
	chmod -R 755 /etc/vsftpd/vsftpd*


vsftpd /etc/vsftpd/vsftpd.conf
# bash