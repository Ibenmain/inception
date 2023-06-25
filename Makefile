
all:
	@./data_host.sh
	docker compose -f srcs/docker-compose.yml build
up:
	docker compose -f srcs/docker-compose.yml up
down:
	docker-compose -f srcs/docker-compose.yml down
re: down up

clean: down
	docker system prune -a
fclean: clean
	docker volume rm $(docker volume ls)
	docker stop $(docker ps -qa)
	docker network prune -f
	docker volume prune -f