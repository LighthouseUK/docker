# Docker: GAE Python Dev Server

# FROM python:2.7.8
FROM google/debian:wheezy
MAINTAINER Lighthouse UK <foss@lighthouseuk.net>

RUN apt-get update && apt-get install --fix-missing -y -q \
	build-essential \
	python2.7 \
	python2.7-dev \
	python-pip \
	git \
	unzip \
	wget

RUN pip install -U pip

# Google App Engine Python SDK

# Download Google App Engine Python SDK
RUN mkdir -p ~/downloads
RUN wget -O ~/downloads/appengine.zip https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.14.zip

# Extract it
RUN unzip ~/downloads/appengine.zip -d /usr/local

RUN printf "opt_in: false\ntimestamp: 0.0\n" > /home/.appcfg_nag

ENV GAE_DEV_SERVER /usr/local/google_appengine/dev_appserver.py

EXPOSE 8080 8000