#!/bin/bash

MARIADB_EXISTS=`docker inspect --format="{{ .Id }}" mariadb 2> /dev/null`
MARIADB_DATA_EXISTS=`docker inspect --format="{{ .Id }}" mariadb-data 2> /dev/null`

if [ -z "$MARIADB_DATA_EXISTS" ]
then
  docker run -d -v /var/lib/mysql --name mariadb-data ubuntu:14.04
fi

if ! [ -z "$MARIADB_EXISTS" ]
then
  docker kill mariadb
  docker rm mariadb
fi
