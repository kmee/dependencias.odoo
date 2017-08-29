FROM ubuntu:16.04
MAINTAINER KMEE dev@kmee.com.br version:0.1

COPY ["install-dependencies.sh", "create-odoo-user.sh", "/root/"]
RUN sh /root/install-dependencies.sh && \
    /root/create-odoo-user.sh

WORKDIR /opt/odoo/
USER odoo
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
