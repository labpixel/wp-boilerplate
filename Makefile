include .env

default: up

COMPOSER_ROOT ?= /var/www/html

## help	:	Lista os comandos do Make.
.PHONY: help
ifneq (,$(wildcard docker.mk))
help : docker.mk
	@sed -n 's/^##//p' $<
else
help : Makefile
	@sed -n 's/^##//p' $<
endif

## build	: 	Constroi as imagens dos containers.
.PHONY: build
build:
	@echo "Build imagens dos containers para $(PROJECT_NAME)..."
	docker-compose build

## up	:	Inicia os containers.
.PHONY: up
up:
	@echo "Iniciando os containers para $(PROJECT_NAME)..."
	docker network create traefik || true
	docker-compose pull
	docker-compose up -d --remove-orphans

## start	:	Inicia os containers sem verificar se há atualizações de imagens.
.PHONY: start
start:
	@echo "Iniciando os containers para $(PROJECT_NAME)..."
	@docker-compose start

## stop	:	Parar os containers.
.PHONY: stop
stop:
	@echo "Parando os container para $(PROJECT_NAME)..."
	@docker-compose stop

## prune	:	Remove o container e todos seus volumes.
##		Você tem a opção de passar o nome do serviço como argumento
##		prune mariadb	: Remove `mariadb` e os volumes.
##		prune mariadb solr	: Remove `mariadb` e `solr` containers e seus volumes volumes.
.PHONY: prune
prune:
	@echo "Removendo os containers para $(PROJECT_NAME)..."
	@docker-compose down -v $(filter-out $@,$(MAKECMDGOALS))

## ps	:	Lista os containers rodando para esse projeto somente.
.PHONY: ps
ps:
	@docker ps --filter name='$(PROJECT_NAME)*'
## shell	:	Acessa `php` container via linha de comando.
##		Você pode passar o nome do serviço como argumento para acessar o container
.PHONY: shell
shell:
	docker exec -ti -e COLUMNS=$(shell tput cols) -e LINES=$(shell tput lines) $(shell docker ps --filter name='$(PROJECT_NAME)_$(or $(filter-out $@,$(MAKECMDGOALS)), 'php')' --format "{{ .ID }}") bash

## logs	:	Veja os logs do container.
##		Você pode passar o nome do serviço como argumento para ver o logs de um container em especifico
##		logs php	: Veja logs do container `php`.
##		logs nginx php	: Veja logs do container `nginx` e `php`.
.PHONY: logs
logs:
	@docker-compose logs -f $(filter-out $@,$(MAKECMDGOALS))

# https://stackoverflow.com/a/6273809/1826109
%:
	@:
