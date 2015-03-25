# Docker: GAE Python Dev Server

# docker run --rm -ti --volumes-from lh-projects lighthouseuk/git "Matthew Badger" "matt@lighthouseuk.net"
# docker run --rm -ti --volumes-from lh-projects --entrypoint=/bin/bash lighthouseuk/git
FROM google/debian:wheezy
MAINTAINER Lighthouse UK <foss@lighthouseuk.net>

RUN apt-get update && apt-get install --fix-missing -y -q \
	git \
	wget

RUN mkdir -p /home
ADD https://bitbucket.org/lighthouseuk/dev-dotfiles/raw/148fc675cae1dd724d89498bb9a072a98eb182ee/git_init.sh /home/
RUN chmod +x /home/git_init.sh

ENTRYPOINT ["/bin/bash"]