all:
	@./data_host.sh
	docker compose -f srcs/docker-compose.yml build
up:
	@./data_host.sh
	docker compose -f srcs/docker-compose.yml up
down:
	docker-compose -f srcs/docker-compose.yml down
re: down up

clean: down
	docker system prune -a
	sudo rm -rf ../data/*