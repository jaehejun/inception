# Makefile
up:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

re: down up

clean: down
		docker system prune -af --volumes