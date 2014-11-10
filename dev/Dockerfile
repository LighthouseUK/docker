# Docker: Lighthouse GAE Python Dev Server
# docker run --rm -i -t -p 127.0.0.1:8080:8080 -p 127.0.0.1:8000:8000 -v /c/Users/matthewbadger/Projects/demo_app/demo_app:/home/app/src lighthouseuk/gaepy-dev-server:1.9.14

# Create the data volume and share it using the samba container. (Only need to do this once)
# Best to keep the path short as I encountered problems with samba when using deep paths e.g. /some/path/to/mount/ would break
# Means you need to create a symlink 
# docker run -v /src --name lh-projects busybox true
# docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba lh-projects
# The container is now available from the boot2docker host @ [BOOT2DOCKER IP]/src (change the path as you like using the first command)

# docker start [CONTAINER ID]

# docker run --rm -ti -p 8080 -p 8000 --volumes-from lh-projects lighthouseuk/gaepy-dev-server:1.9.14

# docker run --rm -ti -p 8080 -p 8000 --volumes-from lh-projects --entrypoint /bin/bash lighthouseuk/gaepy-dev-server:1.9.14

FROM lighthouseuk/gaepy:1.9.14
MAINTAINER Lighthouse UK <foss@lighthouseuk.net>

# Apparently you can't directly use shell variables like this within a dockerfile :(
# RUN export GAE_APP_ROOT="${HOME}/app" && export GAE_APP_PATH="${GAE_APP_ROOT}/src"
ENV GAE_APP_ROOT /home/app
ENV GAE_APP_PATH /home/app/src

RUN mkdir -p /home/app/
ADD https://bitbucket.org/lighthouseuk/dev-dotfiles/raw/9ad0e009778abf4b2964c464aba0684b74c13172/bootstrap_gae.sh /home/app/
RUN chmod +x /home/app/bootstrap_gae.sh

# ONBUILD RUN virtualenv /env && [ -f "/home/app/src/requirements.txt" ] && /env/bin/pip install -r "/home/app/src/requirements.txt"

ENTRYPOINT ["/bin/bash"]
CMD ["/home/app/bootstrap_gae.sh", "--host=0.0.0.0"]