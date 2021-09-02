FROM node:alpine

ENV TIDDLYWIKI_PLUGIN_PATH=/opt/tw5-plugins
#ENV TIDDLYWIKI_THEME_PATH=
#ENV TIDDLYWIKI_LANGUAGE_PATH=
#ENV TIDDLYWIKI_EDITION_PATH=
ENV TS_PORT=8080
ENV TS_SETTINGS_FILE=/mnt/ts/settings.json
ENV TS_LOG_FILE=/mnt/ts/log/ts.log


LABEL maintainer="Maurizio Boero <mauloop@gmail.com>"

VOLUME /mnt/ts
WORKDIR /opt

#RUN apk add --no-cache tini
RUN apk add --no-cache --virtual .build-deps \
    git

#RUN git clone https://github.com/Arlen22/TiddlyServer.git ./
RUN npm install tiddlyserver -g
RUN git clone https://github.com/mauloop/tw5-plugins.git

RUN apk del .build-deps

RUN chmod 777 /usr/local/lib/node_modules/tiddlyserver/datafolder

EXPOSE ${TS_PORT}

#ENTRYPOINT ["/sbin/tini", "--", "tiddlyserver"]
CMD tiddlyserver --config ${TS_SETTINGS_FILE} >${TS_LOG_FILE} 2>&1
