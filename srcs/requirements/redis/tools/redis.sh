#!/bin/bash
# bash
# sed -i -e "s/bind 127.0.0.1 ::1/bind 0.0.0.0/g" /etc/redis/redis.conf
# sed -i -e "s/protected-mode yes/protected-mode no/g" /etc/redis/redis.conf
# sed -i -e "s/daemonize yes/daemonize no/g" /etc/redis/redis.conf
# sed -i -e "s/# requirepass foobared/requirepass born2redis/g" /etc/redis/redis.conf

/usr/bin/redis-server /etc/redis.conf
# /usr/bin/redis-server --protected-mode no

# sed -i -e "s/# requirepass foobared/requirepass born2redis/g" red2.conf