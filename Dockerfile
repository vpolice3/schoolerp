# FROM python:3-onbuild
# RUN pip install --upgrade pip && \
#     pip install numpy
# COPY src/ .
# CMD [ "python", "./schoolerp.py" ]
FROM odoo:13
MAINTAINER Qiang Li

ENV DEBIAN_FRONTEND noninteractive

####
USER root
#
RUN apt-get update \
    && apt-get -y install \
        dnsutils \
        git \
        lsof \
        procps

RUN mkdir -p /opt/odoo/addons \
    && cd /opt/odoo/addons \
    && chown -R odoo /opt/odoo/ \
    && git clone --single-branch -b 11.0 
RUN pip3 install phonenumbers

COPY ./entrypoint.sh /
COPY ./odoo.conf /etc/odoo/
RUN chown odoo /etc/odoo/odoo.conf

####
# Set default user when running the container
USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
##
