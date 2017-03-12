#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run -d --name vrcollab-phpmyadmin --restart always -P \
	--link vrcollab-mariadb:db phpmyadmin/phpmyadmin
echo
docker ps -a -f "name=vrcollab-phpmyadmin*"
