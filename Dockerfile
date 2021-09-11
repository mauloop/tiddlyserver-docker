FROM node:alpine

#ENV TIDDLYWIKI_PLUGIN_PATH=/mnt/ts/plugins
#ENV TIDDLYWIKI_THEME_PATH=/mnt/ts/themes
#ENV TIDDLYWIKI_LANGUAGE_PATH=/mnt/ts/languages
#ENV TIDDLYWIKI_EDITION_PATH=/mnt/ts/editions
ENV TS_PORT=8080
ENV TS_SETTINGS_FILE=/mnt/ts/settings.json
ENV TS_LOG_FILE=/mnt/ts/logs/ts.log


LABEL maintainer="Maurizio Boero <mauloop@gmail.com>"

VOLUME /mnt/ts

RUN npm install tiddlyserver -g

RUN chmod 777 /usr/local/lib/node_modules/tiddlyserver/datafolder

EXPOSE ${TS_PORT}

CMD tiddlyserver --config ${TS_SETTINGS_FILE} >>${TS_LOG_FILE} 2>&1
