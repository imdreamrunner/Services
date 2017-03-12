#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "$GREEN---> Removing existing vrcollab service instances$NC"
docker ps -a -q | xargs docker rm -f
echo

echo -e "$GREEN---> Starting MariaDB$NC"
$DIR/mariadb/run.sh
echo

echo -e "$GREEN---> Starting phpMyAdmin$NC"
$DIR/phpmyadmin/run.sh
echo

echo -e "$GREEN---> Starting Gogs$NC"
$DIR/gogs/run.sh
echo

echo -e "$GREEN---> Stat$NC"
docker ps -a -f "name=vrcollab-*"
