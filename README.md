Docker Pythonapp
================

For running uWSGI python3 app

**Usage:**

* build image: `docker build -t pyapp .`
* build a python3 app. for example, in a folder called testapp
* `testapp/app.py` is the main wsgi file. var `application` must be the wsgi app instance.
* testapp/requirements.txt is used by pip to install required modules
* app/static will be mapped to http://server.address/static/
* run container: docker run -p 80:80 -v /localpath/to/appdir/:/home/python/app/ pythonapp

**Example app:**

http://gitlab.xmopx.net/dave/example-uwsgi-app/tree/master
