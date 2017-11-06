#!/bin/bash
set -x
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
            cups \
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
            default-jre \
            ure \
            libreoffice \
            libreoffice-java-common \
            libreoffice-writer \
            libreoffice-core \
            libreoffice-common \
            fonts-font-awesome\
            fonts-symbola \
            fonts-opensymbol\
            fonts-dejavu\
            fonts-dejavu-core\
            fonts-dejavu-extra\
            fonts-noto\
            fonts-dustin\
            fonts-f500\
            fonts-fanwood\
            fonts-freefont-ttf\
            fonts-liberation\
            fonts-lmodern\
            fonts-lyx\
            fonts-sil-gentium\
            fonts-texgyre\
            fonts-tlwg-purisa\
            libssl-dev\
            autotools-dev\
            cython\
            debhelper\
            dh-strip-nondeterminism\
            docutils-common\
            gfortran\
            gfortran-5\
            libblas-dev\
            libfile-stripnondeterminism-perl\
            libgfortran-5-dev\
            libjs-modernizr\
            libjs-sphinxdoc\
            liblapack-dev\
            libpython-all-dbg\
            libpython-dbg\
            libpython2.7-dbg\
            libpython3-all-dbg\
            libpython3-all-dev\
            libpython3-dbg\
            libpython3.5-dbg\
            po-debconf\
        && locale-gen en_US en_US.UTF-8 pt_BR.UTF-8 \
        && echo "CURL iniciando..." \
        && curl -o wkhtmltox.deb -SL http://nightly.odoo.com/extra/wkhtmltox-0.12.1.2_linux-jessie-amd64.deb \
        && echo '40e8b906de658a2221b15e4e8cd82565a47d7ee8 wkhtmltox.deb' | sha1sum -c - \
        && dpkg --force-depends -i wkhtmltox.deb \
        && apt-get -y install -f --no-install-recommends \
        && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false npm \
        && rm -rf /var/lib/apt/lists/* wkhtmltox.deb \
        && apt-get clean
set +x
