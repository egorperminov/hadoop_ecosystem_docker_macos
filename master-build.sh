#Create network
docker network create -d bridge hive
#Create spark base image
docker build spark/base/ -t spark-base
#Start all containers
docker-compose up