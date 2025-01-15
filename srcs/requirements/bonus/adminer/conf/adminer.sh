#!/bin/bash

echo "Installing Adminer..."

wget https://www.adminer.org/latest.php -O var/www/wordpress/adminer.php 

chown -R www-data:www-data /var/www/wordpress
chmod -R 755 /var/www/wordpress