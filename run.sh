#!/bin/bash -u

docker run \
	--detach \
	--name tiddlyserver \
	--restart always \
	--volume "`pwd`/ts:/mnt/ts" \
	--publish "127.0.0.1:8080:8080" \
	--user "$(id -u):$(id -g)" \
	mauloop/tiddlyserver

