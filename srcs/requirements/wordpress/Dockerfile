FROM alpine:3.14

RUN apk update
RUN apk upgrade
RUN apk add wget curl bash mariadb-client php-mysqli mysql openrc redis
RUN apk add php7 php7-fpm php7-opcache php7-phar php7-common php7-gd php7-iconv php7-json php7-gd php7-curl php7-xml php7-zlib php7-mbstring php7-json php7-session php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
WORKDIR /var/www
# RUN wget http://wordpress.org/latest.tar.gz
# RUN tar -xf latest.tar.gz
# RUN tar -xf wordpress-5.8.3.tar.gz
# RUN rm latest.tar.gz
# RUN mv wordpress /var/www/wordpress
RUN mkdir wordpress
             
 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./fpm.conf /etc/php7/php-fpm.d/www.conf

# RUN chown -R www-data:www-data /var/www/wordpress
# RUN addgroup -g 1000 www-data
RUN adduser -u 1000 -G www-data -h /home/www-data -D www-data
RUN chown -R www-data:www-data /var/www/wordpress
# RUN chown -R root /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress

# RUN wp core download
EXPOSE 9000

VOLUME [ "/sys/fs/cgroup" ]

COPY ./wpress.sh ./wpress.sh
COPY ./wp-redis.conf ./wordpress/wp-redis.conf
RUN chmod +x wpress.sh
RUN chmod +x /var/www/wordpress/wp-redis.conf

# CMD ./wpress.sh
ENTRYPOINT ["./wpress.sh"]
#RUN wp core install --url=example.com --title=Example --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com