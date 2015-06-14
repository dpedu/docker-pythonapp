FROM ubuntu:trusty
MAINTAINER Dave P

# Create user
RUN useradd --create-home --uid 1000 python ; \
    locale-gen en ; \
    echo "python:python" | chpasswd ; \
    apt-get update ; apt-get install -y nginx-full uwsgi uwsgi-plugin-python3 python-virtualenv python3-pip supervisor ; \
    echo "daemon off;" >> /etc/nginx/nginx.conf ; \
    su -c "mkdir /home/python/app/" python ; \
    mkdir /start.d

# install configs & scripts
COPY default /etc/nginx/sites-available/default
COPY pythonapp.ini /etc/uwsgi/apps-enabled/pythonapp.ini
COPY nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY pythonapp.conf /etc/supervisor/conf.d/pythonapp.conf
COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY init-virtualenv /start.d/init-virtualenv
COPY start /start

RUN chmod +x /start ; chmod +x /start.d/init-virtualenv

EXPOSE 80

CMD /start
