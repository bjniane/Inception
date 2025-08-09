include ./srcs/.env
DATA_PATH = /home/${USER_ID}/data

COMPOSE_FILE = ./srcs/docker-compose.yml
COMPOSE_CMD = docker compose -f $(COMPOSE_FILE)

all: up

setup:
	@echo "Setting up directories..."
	@sudo mkdir -p $(DATA_PATH)/mariadb
	@sudo mkdir -p $(DATA_PATH)/wordpress
	@sudo mkdir -p $(DATA_PATH)/redis
	@sudo mkdir -p $(DATA_PATH)/portainer

build: setup
	@echo "building services..."
	$(COMPOSE_CMD) build

up: build
	@echo "Starting services..."
	$(COMPOSE_CMD) up -d

down:
	@echo "Stopping and removing services..."
	$(COMPOSE_CMD) down

stop:
	@echo "Stopping services..."
	$(COMPOSE_CMD) stop

start:
	@echo "Starting services..."
	$(COMPOSE_CMD) start

restart:
	@echo "Restarting services..."
	$(COMPOSE_CMD) restart

ps:
	@echo "Listing running services..."
	$(COMPOSE_CMD) ps

clean:
	@echo "Cleaning up services..."
	@$(COMPOSE_CMD) down --volumes --rmi all --remove-orphans

fclean: clean
	@echo "Removing data directories..."
	@sudo rm -rf $(DATA_PATH)/mariadb
	@sudo rm -rf $(DATA_PATH)/wordpress
	@sudo rm -rf $(DATA_PATH)/redis
	@sudo rm -rf $(DATA_PATH)/portainer

flush:
	@echo "Flushing redis cache..."
	@docker exec -it redis redis-cli FLUSHDB
	@echo "Redis cache flushed!"

re: fclean all

.PHONY: all up down build ps clean fclean re setup stop start restart flush