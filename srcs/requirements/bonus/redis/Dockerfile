FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install redis -y

EXPOSE 6379

COPY conf/redis.conf /etc/redis/redis.conf

CMD [ "redis-server", "/etc/redis/redis.conf" ]