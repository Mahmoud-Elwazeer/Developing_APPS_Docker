#Default compose args
cd simple_web_app
pwd
COMPOSE_ARGS=" -f jenkins.yml -p jenkins "

#Make sure old containers are gone
sudo docker compose $COMPOSE_ARGS stop
sudo docker compose $COMPOSE_ARGS rm --force -v

sudo docker compose $COMPOSE_ARGS build --no-cache
sudo docker compose $COMPOSE_ARGS up -d

sudo docker compose $COMPOSE_ARGS stop
sudo docker compose $COMPOSE_ARGS rm --force -v
