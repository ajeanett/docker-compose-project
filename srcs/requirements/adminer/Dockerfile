FROM alpine:3.14

RUN apk update
RUN apk upgrade


RUN apk add bash
RUN apk add php7 php7-fpm php7-mysqli 
# php7-opcache php7-phar php7-common php7-gd php7-iconv php7-json php7-gd php7-curl php7-xml php7-zlib php7-mbstring php7-json php7-session  php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
# RUN apk add php7-fpm
# php7-fpm php7-mysqli php7-cgi fcgi bash vim 

WORKDIR /var/www

RUN mkdir adminer
RUN chmod -R 755 /var/www/adminer

COPY ./tools/adminer.php ./adminer/adminer.php
COPY ./tools/adminer-srart.sh ./adminer/adminer-srart.sh
COPY ./tools/fpm.conf /etc/php7/php-fpm.d/www.conf

RUN chmod 755 -R /var/www/adminer/adminer.php
RUN chmod +x ./adminer/adminer-srart.sh

RUN adduser -u 1000 -G www-data -h /home/www-data -D www-data
RUN chown -R www-data:www-data /var/www/adminer
   
EXPOSE 9000


# CMD [ "./adminer/adminer-srart.sh" ]
# CMD [ "/bin/bash" ]
ENTRYPOINT ["/bin/bash", "./adminer/adminer-srart.sh"]
