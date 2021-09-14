git pull
docker stop mysql
docker rm mysql
rm -rf /home/operations/luobo/properties/mysql/data/*
docker volume rm $(docker volume ls -q)