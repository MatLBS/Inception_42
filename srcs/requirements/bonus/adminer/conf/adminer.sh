#!/bin/bash

echo "Installing Adminer..."

wget https://github.com/vrana/adminer/releases/download/v4.7.8/adminer-4.7.8.php -P /var/www/html

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html