DATA_DIR := $(HOME)/data
COMPOSE := docker compose -f srcs/docker-compose.yml

.PHONY: all down clean fclean re

all:
	mkdir -p $(DATA_DIR)/mariadb
	mkdir -p $(DATA_DIR)/wordpress
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down --rmi all
	docker system prune -af

fclean:
	$(COMPOSE) down --rmi all -v
	docker volume prune -f
	sudo rm -rf $(DATA_DIR)/mariadb
	sudo rm -rf $(DATA_DIR)/wordpress

re: fclean all