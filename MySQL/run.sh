#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -n "MySQL Username: "
read USERNAME
echo -n "MySQL Password: "
read -s PASSWORD
echo
docker run -d --name vrcollab-mysql-data -v /$DIR/data:/var/lib/mysql busybox
docker run -d --name vrcollab-mysql \
	-e MYSQL_RANDOM_ROOT_PASSWORD=yes \
	-e MYSQL_USER=$USERNAME -e MYSQL_PASSWORD=$PASSWORD \
	--volumes-from vrcollab-mysql-data mysql:latest
echo
docker ps -a -f "name=vrcollab-mysql*"
