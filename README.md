Lighthouse UK Docker Library
======

Dockerfiles and utility scripts we use for working with docker at Lighthouse. At the moment the majority of scripts are built to work with boot2docker so your milage may vary if you are using plain docker. Hopefully they are of some use to others. Feedback is always welcome!

##/.docker_helper
The `.docker_helper` script may be useful to people using boot2docker. It contains some alias commands and a quick setup function for a clean install of boot2docker. It also contains a really simple example of a boot function for a given project. Place the file in your home folder and add `[ -n "$PS1" ] && source ~/.docker_helper;` to your `.bashrc` or `.profile` file in order to have access to it at all times.

##/app_engine_py
`app_engine_py` contains some tools for working with the Google App Engine SDK within docker. The `bootstrap_gae.sh` script is used to automate the configuration and init of the GAE dev server. It is still under active development so please feedback any issues.
