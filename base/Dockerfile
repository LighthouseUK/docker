# Docker: GAE Python Dev Server

FROM python:2.7.8
MAINTAINER Lighthouse UK <foss@lighthouseuk.net>

RUN apt-get update && apt-get install --fix-missing -y \
	unzip \
	wget

# Google App Engine Python SDK

# Download Google App Engine Python SDK
RUN mkdir -p ~/downloads
RUN wget -O ~/downloads/appengine.zip https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.14.zip

# Extract it
RUN unzip ~/downloads/appengine.zip -d /usr/local

ENV GAE_DEV_SERVER /usr/local/google_appengine/dev_appserver.py

EXPOSE 8080 8000