FROM alpine:3.7

RUN set -x ; \
  addgroup -g 1000 -S media ; \
adduser -u 1000 -D -S -G  media media  && exit 0 ; exit 1

RUN apk -U upgrade 
RUN apk add ca-certificates git openssl curl python py2-pip tzdata py2-openssl py-libxml2 py2-lxml
RUN pip install --upgrade pip 
RUN pip install --upgrade  pyopenssl 
RUN mkdir /sabnzbd/Movies /media-apps/data/CouchPotato 
RUN chown -R media:media /media-apps/data/CouchPotato /sabnzbd/Movies 
RUN git clone --depth=1 https://github.com/RuudBurger/CouchPotatoServer.git /couchpotato 
RUN chown -R media:media /couchpotato

EXPOSE 5050

USER media

VOLUME ["/sabnzbd/Movies", "/media-apps/data/CouchPotato"]

CMD ["/usr/bin/python", "/couchpotato/CouchPotato.py", "--data_dir", "/media-apps/data/CouchPotato", "--config_file", "/media-apps/data/CouchPotato/settings.conf", "--console_log"]
