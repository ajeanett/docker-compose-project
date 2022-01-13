FROM alpine:3.14

RUN apk update
RUN apk upgrade

RUN apk add mysql mysql-client bash openrc
      
COPY ./srcs/my.cnf /etc/mysql/
        
COPY ./srcs/start.sh /
COPY ./srcs/wp_base.sql /

RUN mkdir -p /run/mysqld
RUN mkdir -p /run/php

RUN chmod 755  /etc/mysql/my.cnf
RUN chmod +x /start.sh

VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

CMD [ "/start.sh" ]