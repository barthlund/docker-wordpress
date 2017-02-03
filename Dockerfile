FROM centos/php-70-centos7

MAINTAINER barthlund <bart@tagurl.io>

LABEL io.k8s.description="WordPress quickstart deployment. S2I and scaling to more than one replica is not supported." \
      io.k8s.display-name="WordPress with Apache 2.4 and PHP 7.0" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="wordpress,php" \
      io.openshift.non-scalable=true

RUN mkdir /opt/app-root/src \
      && fix-permissions /opt/app-root/src

COPY s2i/bin/* $STI_SCRIPTS_PATH/
COPY contrib/* /opt/app-root/src/

USER 1001
VOLUME /opt/app-root/src
CMD $STI_SCRIPTS_PATH/assemble
