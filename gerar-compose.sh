VERSAO=$(git rev-parse HEAD | cut -c 1-7)
echo TAG=$VERSAO >> .env
docker compose -f docker-compose-template.yml config > docker-compose.yml