# Docker: Lighthouse GAE Python Dev Server
# docker run --rm -i -t -p 8080 -p 8000 -v /c/Users/matthewbadger/Projects/demo_app/demo_app:/home/app/src lighthouseuk/gaepy-dev-server:1.9.14
# docker run --rm -i -t -p 8080 -p 8000 -v /c/Users/matthewbadger/Projects/demo_app/demo_app:/home/app/src --entrypoint /bin/bash lighthouseuk/gaepy-dev-server:1.9.14

FROM lighthouseuk/gaepy:1.9.14
MAINTAINER Lighthouse UK <foss@lighthouseuk.net>

# Apparently you can't directly use shell variables like this within a dockerfile :(
# RUN export GAE_APP_ROOT="${HOME}/app" && export GAE_APP_PATH="${GAE_APP_ROOT}/src"
ENV GAE_APP_ROOT /home/app
ENV GAE_APP_PATH /home/app/src

RUN mkdir -p /home/app/src
ADD https://bitbucket.org/lighthouseuk/dev-dotfiles/raw/79717870cdde9c0098eb61439ddfeecf11747997/bootstrap_gae.sh /home/app/
RUN chmod +x /home/app/bootstrap_gae.sh

ONBUILD RUN virtualenv /env && [ -f "/home/app/src/requirements.txt" ] && /env/bin/pip install -r "/home/app/src/requirements.txt"

ENTRYPOINT ["/bin/bash"]
CMD ["/home/app/bootstrap_gae.sh"]