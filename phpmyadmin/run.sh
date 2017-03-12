#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run -d --name vrcollab-phpmyadmin -d --link vrcollab-mariadb:db -P phpmyadmin/phpmyadmin
echo
docker ps -a -f "name=vrcollab-phpmyadmin*"
