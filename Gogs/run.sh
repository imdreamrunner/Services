#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run -d --name vrcollab-gogs-data -v /$DIR/data:/data busybox
docker run -d --name vrcollab-gogs -p 18181:22 -p 18180:3000 \
	--link vrcollab-mysql:mysql \
	--volumes-from vrcollab-gogs-data gogs/gogs
echo
docker ps -a -f "name=vrcollab-gogs*"
