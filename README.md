Lighthouse UK Docker Library
======

Dockerfiles and utility scripts we use for working with docker at Lighthouse. At the moment the majority of scripts are built to work with boot2docker so your milage may vary if you are using plain docker. Hopefully they are of some use to others. Feedback is always welcome!

##/.docker_helper
The `.docker_helper` script may be useful to people using boot2docker. It contains some alias commands and a quick setup function for a clean install of boot2docker. It also contains a really simple example of a boot function for a given project. Place the file in your home folder and add `[ -n "$PS1" ] && source ~/.docker_helper;` to your `.bashrc` or `.profile` file in order to have access to it at all times.

##/app_engine_py
`app_engine_py` contains some tools for working with the Google App Engine SDK within docker. The `bootstrap_gae.sh` script is used to automate the configuration and init of the GAE dev server. It is still under active development so please feedback any issues.

#Quick tutorial for new devs on Windows or Mac
##Install the latest version of boot2docker
 - Download [boot2docker][1] and install ([Windows instructions][2], [Mac OS X instructions][3])
 - If the installation left you with a docker shell, exit out of it by typing `exit`, otherwise skip this step
 - Run `boot2docker download` to fetch the very latest version of the VM
 - Run `boot2docker init`
 - Run `boot2docker up`

##Create a network mounted work folder for live code editing
 - `docker run -v /src --restart=always --name lh-projects busybox true`
 - `docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba lh-projects`

This will create a data volume which can be mounted into other containers passing `--volumes-from lh-projects` as an argument to `docker run`.

The data volume will also be network shared to your host machine using samba. You should be able to access it via:
 - `cifs://192.168.59.103/src` (Mac)
 - `\\192.168.59.103\src` (Windows)
Key things to notice:
 - `/src` is defined using the `-v` flag. You could change this to anything you like. When using `--volumes-from`, the path you choose (`/src` in this case) will be mounted at the root file system in the container.
 - `--name` allows you to set the name of the data volume. You can then use this when mounting the data volume to other containers.

##Setup a developer environment
This section depends on what project you are working on. This example shows how you could work on a Google App Engine project named 'demo_app'.

Checkout the project into your network shared data volume. You should then have something like `\\192.168.59.103\src\demo_app`

In order to run the project you will need a container with the appropriate GAE SDK. Luckily, we have a ready made one that you can run: `docker run --rm -ti -p 8080 -p 8000 --volumes-from lh-projects --name=demo_app lighthouseuk/gaepy-dev-server:1.9.14 demo_app --host=0.0.0.0`.

Key points:
 - This command will pull out GAE SDK image from docker hub so there is no need to build anything yourself.
 - `--rm` means that once you stop the container it is automatically deleted by docker. Containers should be stateless so do not save anything to them; use the mounted data volume.
 - `-ti` will attach the container console to your terminal window; you will be able to see the output of the GAE SDK dev server
 - `-p 8080 -p 8000` specifies that you want to open up ports `8080` and `8000` (the ports used by GAE SDK dev server)
 - Change the `--volumes-from` flag to match the name of your data container
 - `--name` is exactly what it sounds like. You can use this to set a name with which to reference the container.
 - `lighthouseuk/gaepy-dev-server:1.9.14` is the name of the image you want to run. `lighthouseuk` is the organisation repository on docker hub. `gaepy-dev-server` is the name of the image. `:1.9.14` is a specifically tagged version of the image that we want to use.
 - The rest of the command is arguments that get passed to the bootstrap script which runs inside the container. `demo_app` is the name of the project dir inside the data volume. `--host=0.0.0.0` tells the GAE SDK dev server to allow remote hosts to connect to it instead of just localhost.

*Note: The first time you run the above command it may take a while to load because docker has to download the image.*

Once it completes you should see the output from the GAE SDK dev server in your console.

To view the running app from your host machine you will need to find out the ports that docker is forwarding to this newly running container. Open up a new tab in your console and ssh into docker (`boot2docker ssh`).

Running `docker port demo_app` will show all of the publicly facing ports for the container; something like:
`8080/tcp -> 0.0.0.0:41954
 8000/tcp -> 0.0.0.0:41955`

Fire up your web browser and go to `192.168.59.103:41954` (obviously replace `41954` with whichever port is shown in the above output for `8080/tcp`). You should see the start page for the app.

  [1]: http://boot2docker.io/ "Boot2Docker"
  [2]: http://docs.docker.com/installation/windows/ "Docker Windows install"
  [2]: http://docs.docker.com/installation/mac/ "Docker Mac install"