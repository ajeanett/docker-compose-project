# FROM debian:buster
# LABEL info="by levensta for services"
# WORKDIR /server
# RUN apt update && apt upgrade -y && apt install -y wget bash curl redis-server

# EXPOSE 6379

# COPY ./tools ./

# CMD /bin/bash start.sh
FROM alpine:3.14

RUN apk update
RUN apk upgrade
RUN apk add redis wget curl bash openrc
  
COPY ./tools/redis.sh ./
COPY ./tools/redis.conf /etc/redis.conf

RUN mkdir -p /run/redis/
RUN touch /run/redis/redis.sock

RUN chmod 755 ./redis.sh
RUN chmod 755 /etc/redis.conf
RUN chmod 755 /run/redis/redis.sock

EXPOSE 6379

# CMD ["./redis.sh"]
# CMD ./redis.sh
# CMD ["/bin/bash","./redis.sh"]
ENTRYPOINT ["/bin/bash","./redis.sh"]
# ENTRYPOINT ["./redis.sh"]



