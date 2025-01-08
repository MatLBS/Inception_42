# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: matle-br <matle-br@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/07 21:07:58 by matle-br          #+#    #+#              #
#    Updated: 2024/11/15 17:15:30 by matle-br         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

fclean :
    docker compose -f srcs/docker-compose.yml stop
    docker compose -f srcs/docker-compose.yml down -v
    docker images -f "dangling=true" -q | xargs -r docker rmi
    docker ps -qa | xargs -r docker stop
    docker ps -qa | xargs -r docker rm 
    docker images -qa | xargs -r docker rmi -f
    docker volume ls -q | xargs -r docker volume rm
    - docker network ls -q | xargs -r docker network rm
    docker ps -a -q | xargs -r docker rm -f
    docker images -q | xargs -r docker rmi
    docker system prune -a --force
    cd srcs && docker compose down --volumes --remove-orphans
    docker volume prune --force
    cd srcs && docker compose down -v
    cd srcs && docker compose down -v --rmi all
    - rm srcs/.env

# re : fclean all

# bonus : all

# .PHONY: all clean fclean re




# #TODO

# DATA            :=    ${HOME}/data
# VOLUMES            :=    ${addprefix ${DATA}/,    \
#                         wordpress            \
#                         mariadb                \
#                     }

# mkdir -p ${VOLUMES}  
