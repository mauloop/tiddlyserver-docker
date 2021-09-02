# TiddlyServer Docker image

Simple image to create a docker container for [Tiddly Server](https://github.com/Arlen22/TiddlyServer)

Note: on build, it always uses the latest version from the default branch of Tiddly Server. It also uses the latest version of
node available on docker hub.

## Building the image:

```
# clone the repo
git clone https://github.com/mauloop/tiddlyserver-docker.git

cd tiddlyserver-docker

# build the image
docker build -t mauloop/tiddlyserver .
```

## Running the container:

```
docker run \
	--detach \
	--name tiddlyserver \
	--restart always \
	--volume "/home/tw5adm/ts:/mnt/ts" \
	--publish "80:8080" \
	--user "1001:1001" \
	mauloop/tiddlyserver
```

## Environment variables:
... (to be completed)
