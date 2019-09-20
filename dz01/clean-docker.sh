#!/bin/bash
docker-compose down &&\
	docker system prune -af &&\
	docker volume rm dz01_mariadb-volume &&\
	docker ps && docker images
