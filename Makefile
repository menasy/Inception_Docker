.PHONY: up down build clean

all: build up

init_dirs:
	mkdir -p ~/data/mariadb ~/data/wordpress

build:
	docker-compose -f srcs/docker-compose.yml build

up: init_dirs
	docker-compose -f srcs/docker-compose.yml up -d 

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes
	docker volume prune -f
	doas rm -rf	~/data/wordpress/* ~/data/mariadb/*
