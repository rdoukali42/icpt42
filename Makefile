DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml

all: up

up:down
	@$ docker volume rm  mariadb || true
	@$ docker volume rm wordpress || true
	@$(DOCKER_COMPOSE) up -d

down:
	@$(DOCKER_COMPOSE) down -v

stop:
	@$(DOCKER_COMPOSE) stop

start:
	@$(DOCKER_COMPOSE) start

ps:
	@docker ps

re:
	@ stop && start

.PHONY: all up down stop start ps