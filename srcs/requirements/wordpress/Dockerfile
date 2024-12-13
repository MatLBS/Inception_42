FROM debian:bullseye


RUN apt-get update && \
    apt install -y \
    vim \
    wget \
    mariadb-client && \
    apt-get install php7.3 -y && \
    apt-get install php-fpm -y && \
    apt-get install php-mysql -y && \
    mkdir -p /var/run/wordpress
    # chmod 755 /var/www/html


# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
# Remove old php.ini files (wihtout creating new image)
# RUN rm /usr/local/etc/php/php.ini-development
# RUN rm /usr/local/etc/php/php.ini-production

EXPOSE 9000

# COPY conf/wordpress.conf /usr/local/etc/php

COPY conf/wordpress.conf /etc/wordpress/wordpress.conf

# CMD ["wordpress", "-g", "daemon off;"]