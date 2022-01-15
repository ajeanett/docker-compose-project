FROM alpine:3.14

RUN apk update
RUN apk upgrade

RUN apk add nginx openssl vsftpd openrc bash

COPY ./tools/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./tools/ftp-start.sh /ftp-start.sh
RUN chmod -R 755 /ftp-start.sh

# RUN mkdir -p /var/www/ftp
RUN mkdir -p /var/www/wordpress
# RUN chmod -R 755 /var/www/wordpress
# RUN chmod -R a-w /var/www/wordpress
RUN chmod -R 666 /var/www/wordpress
RUN mkdir -p /var/log/
RUN chmod -R 755 /var/log

# RUN adduser -D 'ajeanett'; echo "ajeanett:superpassword" | chpasswd

# RUN echo 'root:root' | chpasswd

# RUN echo "ajeanett" >> /etc/vsftpd/vsftp.userlist

# RUN openssl req -x509 -nodes -days 90 -newkey rsa:2048 \
# 	-subj "/C=ru/ST=Kazan/L=Kazan/O=School21/OU=School21/CN=ajeanette/" \
# 	-keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem && \
# 	chmod -R 755 /etc/vsftpd/vsftpd*

EXPOSE 21

VOLUME [ "/sys/fs/cgroup" ]

RUN mkdir -p /var/ftp
RUN chmod -R 755 /var/ftp
# RUN sleep 15

# ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf