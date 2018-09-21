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
    mkdir /data /movies && \
    chown -R media:media /data /movies && \
\
    git clone --depth=1 https://github.com/RuudBurger/CouchPotatoServer.git /couchpotato && \
    chown -R media:users /couchpotato

EXPOSE 5050

USER media

VOLUME ["/data", "/movies"]

CMD ["/usr/bin/python", "/couchpotato/CouchPotato.py", "--data_dir", "/data", "--config_file", "/data/settings.conf", "--console_log"]
