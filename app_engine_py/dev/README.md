##Boot2docker Developer Google App Engine SDK Environment

This image builds ontop of the base `lighthouseuk/gaepy` image. It is designed to be used as a developer environment, not as a distribution for testing etc. 
By using a mounted volume that is shared across the network we get the benefit of live code editing on the boot2docker host machine. (The network share is necessary as virtualbox mounts from the host do not trigger file system events on the linux guests).

 - If you have any questions you can reach us at: foss at
   lighthouseuk.net.
 - Please visit our [github][1] page to report any issues.

###This image:

 - Sets some environment vars for the application dirs (`/home/app`, `/home/app/src`)
 - Creates application root dir (`/home/app`)
 - Downloads our bootstrap script, marks it executable
 - Invokes the bootstrap script via the CMD directive with a host flag (`--host=0.0.0.0`) to enable remote access.

###To run this image:

 - `docker run -v /src --restart=always --name lh-projects busybox true`
 - `docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba lh-projects`
 - `docker run --rm -ti -p 8080 -p 8000 --volumes-from lh-projects lighthouseuk/gaepy-dev-server:1.9.18`

*Note: you can customise the above to your liking - the mount points and container names are what we use internally.*

*Note: the last run command above does not set a host port to bind as you may have multiple containers running the same port. Use the `docker port` command to find the correct port to access on your host. Alternately change the `-p` flags to `-p 8080:8080 -p 8000:8000`.*

*Note: the bootstrap script assumes you have a volume with a mount point of `/src`. It will create a symlink from `/src/demo_app` to `/home/app/src`.*

For anyone that wants to see the Dockerfiles used, we have a [repo][1]. This particular image was built from the Dockerfile in `app_engine_py/dev`.



  [1]: https://github.com/LighthouseUK/docker "LighthouseUK Github"