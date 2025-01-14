COMPOSE = docker compose
FLAGS = -f
COMPOSE_PATH = ./srcs/docker-compose.yml
DATA = /home/matle-br/data
MARIADB_VOLUME = /home/matle-br/data/mariadb
WORDPRESS_VOLUME = /home/matle-br/data/wordpress

all: up

up:
	@mkdir -p $(DATA) $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)
	@sudo chmod 755 $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)
	@sudo service mariadb stop
	@$(COMPOSE) $(FLAGS) $(COMPOSE_PATH) up --build

down :
	@$(COMPOSE) $(FLAGS) $(COMPOSE_PATH) down
	@docker system prune -a --force
	@docker images -qa | xargs -r docker rmi -f

fclean :
	@$(COMPOSE) $(FLAGS) $(COMPOSE_PATH) stop
	@$(COMPOSE) -f $(COMPOSE_PATH) down -v --remove-orphans
	@docker system prune -a -f --volumes
	@docker images -qa | xargs -r docker rmi -f
	@docker volume ls -q | xargs -r docker volume rm
	@sudo rm -rf $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)

re: fclean up

.PHONY: all up down fclean re