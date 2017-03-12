#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -n "MariaDB root password: "
read -s PASSWORD
echo
docker run -d --name vrcollab-mariadb-data -v /$DIR/data:/var/lib/mysql busybox
docker run -d --name vrcollab-mariadb --restart always \
	--volumes-from vrcollab-mariadb-data \
	-e MYSQL_ROOT_PASSWORD=$PASSWORD mariadb
echo
docker ps -a -f "name=vrcollab-mariadb*"
