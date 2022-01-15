all: prepare_dir build 

prepare_dir: 
		mkdir -p ./srcs/data/db
		mkdir -p ./srcs/data/wordpress
		mkdir -p ./srcs/data/wordpress/adminer
		chmod -R 777 ./srcs/data/
		cp -pfr ./srcs/requirements/tools/www ./srcs/data/wordpress/
		cp -pfr ./srcs/requirements/tools/html ./srcs/data/wordpress/resume

remove_dir: 
		rm -r ./srcs/data

build:				;	docker-compose -f ./srcs/docker-compose.yml build

up:					;	docker-compose -f ./srcs/docker-compose.yml up

start:				;	docker-compose -f ./srcs/docker-compose.yml start

stop:				;	docker-compose -f ./srcs/docker-compose.yml stop

down:				;	docker-compose -f ./srcs/docker-compose.yml down

stop_down:			stop down

images:
	docker images

delete_images:
	docker rmi $(docker images -a -q)

delete_containers:
	docker rm $(docker ps -a -q)

clean:
	#  docker volume prune -f
	docker system prune -a --volumes -f
	docker volume rm db
	docker volume rm wp
	docker volume rm adminer

clean_data:
	rm -rf ./srcs/data

re: clean all

.PHONY:
	all build up start stop stop_down down images delete_images delete_containers re

