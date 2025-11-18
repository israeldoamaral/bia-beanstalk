VERSAO=$(git rev-parse HEAD | cut -c 1-7)
ECR_REGISTRY="528424611297.dkr.ecr.us-east-1.amazonaws.com"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REGISTRY
docker build -t bia .
docker tag bia:latest $ECR_REGISTRY/bia:$VERSAO
docker push $ECR_REGISTRY/bia:$VERSAO
rm .env 2> /dev/null
./gerar-compose.sh
rm bia-versao-*zip 2> /dev/null 2>&1
zip -r bia-versao-$VERSAO.zip docker-compose.yml

