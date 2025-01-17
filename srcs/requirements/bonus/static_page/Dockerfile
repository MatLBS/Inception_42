FROM debian:bullseye

RUN mkdir -p /var/www/home

COPY static /var/www/home
COPY conf/static_page.sh /static_page.sh

RUN chmod 777 static_page.sh

ENTRYPOINT ["/static_page.sh"]
