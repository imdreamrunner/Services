#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p $DIR/data

docker run -d --name vrcollab-owncloud-data -v /$DIR/data:/var/www/html busybox
docker run -d --name vrcollab-owncloud --restart always -p 18081:80 \
	--link vrcollab-mariadb:mysql \
	--volumes-from vrcollab-owncloud-data owncloud
echo
docker ps -a -f "name=vrcollab-owncloud*"
