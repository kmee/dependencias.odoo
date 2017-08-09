FROM ubuntu:16.04
MAINTAINER KMEE infra@kmee.com.br version:0.1
RUN set -x; \
        locale-gen en_US en_US.UTF-8 pt_BR.UTF-8 \
        && apt-get update \
        && apt-get install -y --no-install-recommends \
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
        && adduser --system --quiet --shell=/bin/bash --home=/opt/odoo --gecos 'ODOO' --group odoo
        && echo 'export PATH=$PATH:/usr/local/bin' >> /home/odoo/.bashrc \
        && echo 'export TERM=xterm' >> /home/odoo/.bashrc \
        && echo 'export LANG=pt_BR.UTF-8' >> /home/odoo/.bashrc \
        && echo 'export LANGUAGE=pt_BR:en_GB' >> /home/odoo/.bashrc \
        && echo 'export LC_ALL=pt_BR.UTF-8' >> /home/odoo/.bashrc

