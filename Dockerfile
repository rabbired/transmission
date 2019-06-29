FROM linuxserver/transmission:latest as build

MAINTAINER RedZ <rabbired@outlook.com>

#RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main" > /etc/apk/repositories

RUN apk update && \
	apk add --no-cache python3 && \
	python3 -m ensurepip && \
	rm -r /usr/lib/python*/ensurepip && \
	pip3 install --upgrade pip setuptools && \
	if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
	if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
	pip3 install autoremove-torrents && \
	pip3 install flexget && \
	rm -rf /var/cache/apk/*

COPY 99-custom-files /etc/cont-init.d/99-custom-files
