# https://hub.docker.com/r/camptocamp/odoo-project
FROM camptocamp/odoo-project:12.0-buster-latest-batteries

RUN apt-get update \
    && apt-get install -y --no-install-recommends nano wget git tig libxmlsec1-dev build-essential python3-dev locales swig3.0 fonts-symbola libreoffice \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/swig3.0 /usr/bin/swig

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

COPY ./src /odoo/src
RUN pip install -e /odoo/src

COPY ./requirements.txt /odoo/requirements.txt
RUN pip install -r /odoo/requirements.txt
