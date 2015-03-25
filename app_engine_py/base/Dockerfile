# Docker: GAE Python Dev Server

# FROM python:2.7.8
FROM google/debian:wheezy
MAINTAINER Lighthouse UK <foss@lighthouseuk.net>

RUN \
	apt-get --quiet --yes update && \
	apt-get install --fix-missing -y -q \
	build-essential \
	python2.7 \
	python2.7-dev \
	python-pip \
	git \
	unzip \
	wget && \
	pip install -U pip && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists && \
	wget --quiet -O appengine.zip https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.18.zip && \
	unzip -q appengine.zip -d /usr/local && \
	rm appengine.zip && \
	printf "opt_in: false\ntimestamp: 0.0\n" > /root/.appcfg_nag

ENV GAE_DEV_SERVER /usr/local/google_appengine/dev_appserver.py

EXPOSE 8080 8000

