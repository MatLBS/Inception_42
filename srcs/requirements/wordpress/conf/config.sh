#!/bin/bash

sleep 10

if [ -f ./wp-config.php ]
then
    echo "Wordpress already installed, skipping download and configuration."
else
    wp core download --allow-root \
    && wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root --path='/var/www/wordpress' \
    && wp core install --url=https://localhost --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_MAIL --allow-root --path='/var/www/wordpress' \
    && wp create user $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWD --porcelain --allow-root
fi

# /usr/sbin/php-fpm7.3 -F -R