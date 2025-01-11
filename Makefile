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

clean :
	@$(COMPOSE) $(FLAGS) $(COMPOSE_PATH) stop
	@$(COMPOSE) $(FLAGS) $(COMPOSE_PATH) down -v
	@docker volume prune --force
	@docker system prune -a --force
	@docker images -qa | xargs -r docker rmi -f
	@docker volume ls -q | xargs -r docker volume rm
	@docker network ls -q | xargs -r docker network rm
	@cd srcs && docker compose down --volumes --remove-orphans
	@sudo rm -rf $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)

fclean :
	@$(COMPOSE) $(FLAGS) $(COMPOSE_PATH) stop
	@$(COMPOSE) $(FLAGS) $(COMPOSE_PATH) down -v
	@docker volume prune --force
	@docker system prune -a --force
	@docker images -qa | xargs -r docker rmi -f
	@docker volume ls -q | xargs -r docker volume rm
	@cd srcs && docker compose down --volumes --remove-orphans
	@sudo rm -rf $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)

re: fclean up

.PHONY: all up clean fclean re