# TiddlyServer Docker image

This is a simple Dockerfile to create a container for [TiddlyServer](https://github.com/Arlen22/TiddlyServer). It is based on [xyder/docker-tiddly-server](https://github.com/xyder/docker-tiddly-server) plus the following enhancements:

* uses the latest TiddlyServer release.
* a default basic Tiddlyserver config file file is provided.
* runtime env vars are defined to allow custom paths for plugins, themes, languages and editions.
* Tiddlywiki is updated to the latest release)[^1] (new).

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
	mauloop/tiddlyserver
```

After the container has been started you can point your browser to http://localhost:8080.

## TiddlyServer settings

Actual settings are intended for personal or development use, not to make the server public.

An empty wiki named testwiki, based on vanilla server edition, is already defined in TiddlyServer config files.
To add your own or create a new one, copy it in `ts/TW5` subfolder and restart the container. If you need more sofisticated settings please refer to [TiddlyServer documentation](https://arlen22.github.io/tiddlyserver/docs/serverconfig.html) to change settings.json.

## Environment variables:

Add `--env VAR=value` to the `docker run` command to override the following defaults (remembers paths must be in the `ts` subfolder and must be referred as `/mnt/ts/path`).
Alternatively you can change defaults in Dockerfile and rebuild.

```
TS_PORT=8080
TS_SETTINGS_FILE=/mnt/ts/settings.json
TS_LOG_FILE=/mnt/ts/logs/ts.log
```

Add `--env VAR=value` to the `docker run` command to set custom Tiddlywiki components paths (remembers paths must be in the `ts` subfolder and must be referred as `/mnt/ts/path`).
Alternatively you can set defaults in Dockerfile and rebuild. Actual values are as from Tiddlywiki core settings.

```
TIDDLYWIKI_PLUGIN_PATH=/mnt/ts/plugins
TIDDLYWIKI_THEME_PATH=/mnt/ts/themes
TIDDLYWIKI_LANGUAGE_PATH=/mnt/ts/languages
TIDDLYWIKI_EDITION_PATH=/mnt/ts/editions
```

[^1]: At the time I am writing this README, latest Tiddlyserver release is `2.2` beta (released on dec '20), which in turns provides Tiddlywiki `5.2.1`, while latest is `5.2.7`. It is not guaranteed that newer TW5 releases work, since they are not certified by Tiddlyserver author (@Arlen22). Otherwise there is no reason they should not. I ran TW `5.2.7` on TS `2.2 beta` and it looked like everything was ok. In any case you can force a specific TW5 release changing the Dockerfile line `RUN npm install tiddlywiki -g` to `RUN npm install tiddlywiki@5.2.5 -g` (if 5.2.5 i the TW5 release you would like), then rebuild the container.
