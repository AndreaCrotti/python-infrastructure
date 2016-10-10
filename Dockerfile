FROM ubuntu:16.04
MAINTAINER Andrea <andrea.crotti.0@gmail.com>

#TODO: try to set a few environment variables?

# running update in the same instruction as suggested here
# to avoid possible caching issues
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#/run
RUN apt-get -qy update && apt-get install -y \
    # for Pandas and similar libraries
    libblas-dev \
    liblapack-dev \
    python-dev \
    # database settings
    libmysqlclient-dev \
    libpq-dev \
    # various utils
    git \
    python-pip
    # g++ libfreetype6-dev python-matplotlib libxml2-dev libxslt-dev gfortran libssl-dev libpng-dev libffi-dev libcairo2-dev libblas-dev liblapack-dev graphviz libpq-dev postgresql-client

RUN mkdir -p /deploy/app

#TODO: could use volumes or git archive instead here
COPY django_proj django_proj /deploy/app/
COPY requirements.txt /deploy/app/

RUN pip install -r /deploy/app/requirements.txt

COPY docker_test.sh /
CMD ["/docker_test.sh"]
