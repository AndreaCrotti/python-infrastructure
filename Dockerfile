FROM ubuntu:16.04
MAINTAINER Andrea <andrea.crotti.0@gmail.com>

ENV DATABASE_URL "postgres://test_django:test_django@test_db/test_django"
#TODO: the database to use could be set here


# running update in the same instruction as suggested here
# to avoid possible caching issues
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#/run

RUN apt-get -qy update && apt-get install -y \
    python-dev \
    # libraries needed for databases
    libmysqlclient-dev \
    libpq-dev \
    # various utils
    git \
    python-pip \
    python-matplotlib \
    python-pandas \
    python-scipy \
    python-seaborn

# alternatively install all the dependencies by hand, use `aptitude show package-name`
# to see what are all the system level packages needed

RUN mkdir -p /deploy/app

#TODO: could use volumes or git archive instead here
COPY django_proj django_proj /deploy/app/
COPY requirements.txt /deploy/app/

# this means we could test different branches just by packing a different version??
# might be an issue for dependencies though.
# Doing a shallow clone could be another option if we want to be able to run any branches
# RUN git archive HEAD django_proj -o app.tar.gz

# RUN tar -xvzf app.tar.gz /deploy/app/

#TODO: add a requirement from another package
RUN pip install -U pip
RUN pip install -r /deploy/app/requirements.txt

COPY docker_test.sh /
CMD ["/docker_test.sh"]
