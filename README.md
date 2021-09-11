# TiddlyServer Docker image

Simple image to create a docker container for [TiddlyServer](https://github.com/Arlen22/TiddlyServer)

Note: on build, it always uses the latest version from the default branch of TiddlyServer. It also uses the latest version of node available on docker hub.

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
	--volume "`pwd`/ts:/mnt/ts" \
	--publish "127.0.0.1:8080:8080" \
	--user "$(id -u):$(id -g)" \
	--env TIDDLYWIKI_PLUGIN_PATH=/mnt/ts/plugins \
	mauloop/tiddlyserver
```

After the container has been started you can point your browser to http://localhost:8080.

## TiddlyServer settings

Actual settings are intended for personal or development use, not to make the server public.

An empty wiki named testwiki, based on vanilla server edition, is already defined in TiddlyServer config files.
To add your own or create a new one, copy it in `ts/TW5` subfolder and restart the container. If you need more sofisticated settings please refer to [TiddlyServer documentation](https://arlen22.github.io/tiddlyserver/docs/serverconfig.html) to change settings.json.

## Environment variables:

Add `--env VAR=value` to the `docker run` command to override the following defaults (remembers paths must be in the `ts` subfolder and must be referred as `/mnt/ts/path`).
Alternatively you can change defaults in Docker file and rebuild.

```
TS_PORT=8080
TS_SETTINGS_FILE=/mnt/ts/settings.json
TS_LOG_FILE=/mnt/ts/logs/ts.log
```

Add `--env VAR=value` to the `docker run` command to set custom Tiddlywiki components paths (remembers paths must be in the `ts` subfolder and must be referred as `/mnt/ts/path`).
Alternatively you can set defaults in Docker file and rebuild. Actual values are as from Tiddlywiki core settings.

```
TIDDLYWIKI_PLUGIN_PATH=/mnt/ts/plugins
TIDDLYWIKI_THEME_PATH=/mnt/ts/themes
TIDDLYWIKI_LANGUAGE_PATH=/mnt/ts/languages
TIDDLYWIKI_EDITION_PATH=/mnt/ts/editions
```

