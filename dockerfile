FROM apache/nifi-registry

# git user and personal access token
ARG user
ARG token

USER root

# install git
RUN apt update \
    && apt-get upgrade -y \
    && apt install -y git

RUN git clone https://${token}@github.com/msk-mind/etl.git /opt/nifi-registry/nifi-registry-current/etl

RUN chown -R nifi:nifi /opt/nifi-registry/nifi-registry-current/

COPY conf/providers.xml /opt/nifi-registry/nifi-registry-current/conf/

# modify providers.xml with user, token
RUN sed -i.bak "s/<property name=\"Remote Access User\"><\/property>/<property name=\"Remote Access User\">${user}<\/property>/g" /opt/nifi-registry/nifi-registry-current/conf/providers.xml \
&& sed -i.bak "s/<property name=\"Remote Access Password\"><\/property>/<property name=\"Remote Access Password\">${token}<\/property>/g" /opt/nifi-registry/nifi-registry-current/conf/providers.xml \
&& rm /opt/nifi-registry/nifi-registry-current/conf/providers.xml.bak

# change permission for openshift
RUN chgrp -R 0 /opt/nifi-registry/nifi-registry-current && \
    chmod -R g=u /opt/nifi-registry/nifi-registry-current

USER nifi

ENTRYPOINT ["../scripts/start.sh"]
