DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml

all: up

up:
	@$(DOCKER_COMPOSE) up -d

down:
	@$(DOCKER_COMPOSE) down

stop:
	@$(DOCKER_COMPOSE) stop

start:
	@$(DOCKER_COMPOSE) start

status:
	@docker ps

.PHONY: all up down stop start status