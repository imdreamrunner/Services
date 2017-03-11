DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run -d --name nextcloud-data -v /$DIR/data:/var/www/html busybox
docker run -d --name nextcloud -p 18182:9000 --volumes-from nextcloud-data indiehosters/nextcloud
docker ps
