FROM alpine:3.14

RUN apk update
RUN apk upgrade
  
RUN apk add nginx bash openssl vim openrc

RUN mkdir -p /run/nginx
               
RUN chmod 755 /run/nginx
            
# COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf
COPY ./tools/start.sh /etc/start.sh
COPY ./tools/index.html /var/www/wordpress/

RUN chmod +x /etc/start.sh
   
# RUN adduser -D 'ajeanett'; echo "ajeanett:pass" | chpasswd

#ssl
RUN openssl req -x509 -nodes -days 31 -newkey rsa:2048 \
	-subj "/C=ru/ST=Kazan/L=Kazan/O=School21/OU=School21/CN=ajeanette/" \
	-keyout /etc/ssl/private/nginx-ajeanette.key -out /etc/ssl/certs/nginx-ajeanette.crt && \
	chmod -R 755 /etc/ssl/private/nginx-ajeanette*

EXPOSE 443
   
CMD [ "/etc/start.sh" ]
