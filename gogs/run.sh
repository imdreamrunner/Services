#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p $DIR/data

docker run -d --name vrcollab-gogs-data -v /$DIR/data:/data busybox
docker run -d --name vrcollab-gogs --restart always -p 18080:3000 -p 18022:22 \
	--link vrcollab-mariadb:mysql \
	--volumes-from vrcollab-gogs-data gogs/gogs
echo
docker ps -a -f "name=vrcollab-gogs*"
