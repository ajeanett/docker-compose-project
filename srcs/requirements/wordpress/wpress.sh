#!/bin/bash
sleep 12
cd wordpress/
if [ ! -e /var/www/wordpress/wp-config.php ]; then
echo "Start install wordpress"
wp core download --allow-root 
wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST
echo "wp config created"
wp core install --allow-root --url=$DOMAIN_NAME --title=MyPage --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=info@example.com
echo "wp core install completed"
wp user create --allow-root $USER_NAME $USER_MAIL --user_pass=$USER_PASS --role=author
echo "wp user created"
wp core version --allow-root
sed -i '40,58d;39r ./wp-redis.conf' /var/www/wordpress/wp-config.php

wp plugin install redis-cache --allow-root
wp plugin activate redis-cache --allow-root
wp redis enable --allow-root
fi

php-fpm7 -F