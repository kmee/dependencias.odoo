FROM ubuntu:16.04
MAINTAINER KMEE dev@kmee.com.br version:0.1

RUN set -x; \
        apt-get update \
	&& apt-get install -y --no-install-recommends \
            locales \
            ca-certificates \
            nano \
            wget \
            git \
            mercurial \
            screen \
            htop \
            curl \
            openssh-client \
            node-less \
            node-clean-css \
            tig \
            binutils \
            build-essential \
            bzr \
            ca-certificates \
            cpp \
            gcc \
            dpkg-dev \
            fontconfig \
            fontconfig-config \
            gir1.2-glib-2.0 \
            git \
            git-core \
            git-man \
            tar \
            zip \
            gzip \
            zlib1g \
            sudo \
            virtualenv \
            libffi-dev \
            expect-dev \
#            python-lxml \
            libxml2-dev \
            libxslt-dev \
            gcc \
            python2.7-dev \
            libevent-dev \
            libsasl2-dev \
            libldap2-dev \
            libpq-dev \
            libpng12-dev \
            libjpeg-dev \
            xfonts-75dpi \
            xfonts-base \
            postgresql-client* \
        && locale-gen en_US en_US.UTF-8 pt_BR.UTF-8 \
        && echo "CURL iniciando..." \
#
# Instalando o wkhtmltox
#
        && curl -o wkhtmltox.deb -SL http://nightly.odoo.com/extra/wkhtmltox-0.12.1.2_linux-jessie-amd64.deb \
        && echo '40e8b906de658a2221b15e4e8cd82565a47d7ee8 wkhtmltox.deb' | sha1sum -c - \
        && dpkg --force-depends -i wkhtmltox.deb \
        && apt-get -y install -f --no-install-recommends \
        && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false npm \
        && rm -rf /var/lib/apt/lists/* wkhtmltox.deb \
#
# Final setup
#
        && apt-get clean \
        && adduser --system --quiet --shell=/bin/bash --home=/opt/odoo --gecos 'ODOO' --group odoo \
        && touch /opt/odoo/.bashrc \
        && echo 'export PATH=$PATH:/usr/local/bin' >> /opt/odoo/.bashrc \
        && echo 'export TERM=xterm' >> /opt/odoo/.bashrc \
        && echo 'export LANG=pt_BR.UTF-8' >> /opt/odoo/.bashrc \
        && echo 'export LANGUAGE=pt_BR:en_GB' >> /opt/odoo/.bashrc \
        && echo 'export LC_ALL=pt_BR.UTF-8' >> /opt/odoo/.bashrc
USER odoo
WORKDIR /opt/odoo/
#
# Buildout default file for cache eggs!
#
RUN mkdir -p .buildout
COPY pre-buildout/default.cfg .buildout/default.cfg
#
# Run the buildout just to fill .buildout/eggs with Odoo Eggs!
# We must have the the odoo deployed in Q&A
#
# In one or two minutes after a commit
#
RUN mkdir -p /tmp/workspace
ADD pre-buildout/* /tmp/workspace/
WORKDIR /tmp/workspace/
RUN sh build
#
# Clean tmp folder!
#
WORKDIR /opt/odoo
RUN rm -rf /tmp/workspace/
