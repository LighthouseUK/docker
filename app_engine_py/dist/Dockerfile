# Docker: Lighthouse GAE Python Project - Lightwork

FROM lighthouseuk/gaepy:1.9.14
MAINTAINER Lighthouse UK <foss@lighthouseuk.net>

# Apparently you can't directly use shell variables like this within a dockerfile :(
# RUN export GAE_APP_ROOT="${HOME}/app" && export GAE_APP_PATH="${GAE_APP_ROOT}/src"
ENV GAE_APP_ROOT /home/app
ENV GAE_APP_PATH /home/app/src

RUN mkdir -p /home/app/src
ADD https://bitbucket.org/lighthouseuk/dev-dotfiles/raw/09512c7acb915d38f49652c93c40840dded529fc/bootstrap_gae.sh /home/app/
RUN chmod +x /home/app/bootstrap_gae.sh

ONBUILD RUN virtualenv /env
ONBUILD ADD . /home/app/src
ONBUILD RUN [ -f "/home/app/src/requirements.txt" ] && /env/bin/pip install -r "/home/app/src/requirements.txt"

ENTRYPOINT ["/bin/bash"]
CMD ["/home/app/bootstrap_gae.sh"]