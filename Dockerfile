FROM alpine:3.7

RUN apk -U upgrade && \
    apk add --no-cache \
      ca-certificates \
      git \
      openssl \
      curl \
      python \
      py2-pip \
      tzdata \
      py2-openssl py-libxml2 py2-lxml && \
\
    pip install \
      pyopenssl && \
\
    adduser -u media -S media -G media && \
    mkdir /sabnzbd/Movies /media-apps/data/CouchPotato && \
    chown -R media:media /media-apps/data/CouchPotato /sabnzbd/Movies && \
\
    git clone --depth=1 https://github.com/RuudBurger/CouchPotatoServer.git /couchpotato && \
    chown -R media:media /couchpotato

EXPOSE 5050

USER media

VOLUME ["/sabnzbd/Movies", "/media-apps/data/CouchPotato"]

CMD ["/usr/bin/python", "/couchpotato/CouchPotato.py", "--data_dir", "/media-apps/data/CouchPotato", "--config_file", "/media-apps/data/CouchPotato/settings.conf", "--console_log"]
