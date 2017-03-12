#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p $DIR/data

docker run -d --name vrcollab-phpmyadmin --restart always -p 18082:80 \
	--link vrcollab-mariadb:db phpmyadmin/phpmyadmin
echo
docker ps -a -f "name=vrcollab-phpmyadmin*"
