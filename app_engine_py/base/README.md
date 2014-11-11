##Minimal Google App Engine SDK Environment

Designed to be used as a base image for setting up custom developer environments which use Google App Engine. 

 - If you have any questions you can reach us at: foss at
   lighthouseuk.net.
 - Please visit our [github][1] page to report any issues.

###This image:
 - Downloads the Google App Engine SDK from
   [https://storage.googleapis.com/appengine-sdks/][1]
 - Exposes ports `8080`, `8000`
 - Disabled dev_appserver update check

###To run this image:

 - `docker run --rm -ti -p 8080 -p 8000 lighthouseuk/gaepy:1.9.14`

For anyone that wants to see the Dockerfiles used, we have a [repo][1]. This particular image was built from the Dockerfile in `app_engine_py/base`.



  [1]: https://github.com/LighthouseUK/docker "LighthouseUK Github"