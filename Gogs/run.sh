DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run -d --name gogs-data -v /$DIR/data:/data busybox
docker run -d --name gogs -p 18181:22 -p 18180:3000 --volumes-from gogs-data gogs/gogs
echo
docker ps -a -f "name=gogs*"
