#!/bin/bash
set -e
adduser --system --quiet --shell=/bin/bash --home=/opt/odoo --gecos 'ODOO' --group odoo \
        && touch /opt/odoo/.bashrc \
        && echo 'export PATH=$PATH:/usr/local/bin' >> /opt/odoo/.bashrc \
        && echo 'export TERM=xterm' >> /opt/odoo/.bashrc \
        && echo 'export LANG=pt_BR.UTF-8' >> /opt/odoo/.bashrc \
        && echo 'export LANGUAGE=pt_BR:en_GB' >> /opt/odoo/.bashrc \
        && echo 'export LC_ALL=pt_BR.UTF-8' >> /opt/odoo/.bashrc
set +e

