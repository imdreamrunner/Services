#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run -d --name vrcollab-gogs-data -v /$DIR/data:/data busybox
docker run -d --name vrcollab-gogs -P \
	--link vrcollab-mariadb:mysql \
	--volumes-from vrcollab-gogs-data gogs/gogs
echo
docker ps -a -f "name=vrcollab-gogs*"
