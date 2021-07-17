FROM linuxserver/transmission:latest

MAINTAINER RedZ <rabbired@outlook.com>

RUN \
  apk add --no-cache python3 py3-pip \
  py3-greenlet py3-brotli py3-psutil \
  py3-lxml py3-gevent \
  python3-dev gcc libxml2-dev libxslt-dev libffi-dev musl-dev linux-headers g++ && \
  pip3 --no-cache-dir install -U pip && \
  if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
  if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
  if [[ ! -e /usr/local/bin/flexget ]]; then ln -sf `which flexget` /usr/local/bin/flexget; fi && \
  pip3 install autoremove-torrents && \
  pip3 install flexget && \
  apk del --purge python3-dev gcc libxml2-dev libxslt-dev \
    libffi-dev musl-dev linux-headers g++ && \
  rm -rf \
    /var/lib/apk/lists/* \
    /var/cache/apk/* \
	/root/.cache \
	/tmp/*

COPY 99-custom-files /etc/cont-init.d/99-custom-files
