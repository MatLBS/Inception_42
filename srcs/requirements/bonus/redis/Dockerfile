FROM	debian:bullseye

RUN	apt-get update && apt-get upgrade -y && \
	apt-get install redis -y && \
	apt-get install php-redis -y

EXPOSE	6379

CMD	["redis-server", "--bind", "0.0.0.0", "--protected-mode no"]	