FROM centos/php-56-centos7

MAINTAINER AusNimbus <support@ausnimbus.com.au>

LABEL io.k8s.description="WordPress quickstart deployment. S2I and scaling to more than one replica is not supported." \
      io.k8s.display-name="WordPress with Apache 2.4 and PHP 5.6" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="wordpress,php" \
      io.openshift.non-scalable=true

RUN mkdir /opt/app-root/src/wordpress \
      && fix-permissions /opt/app-root/src/wordpress

# Copied from the official Wordpress Docker image
RUN { \
      echo 'opcache.memory_consumption=128'; \
      echo 'opcache.interned_strings_buffer=8'; \
      echo 'opcache.max_accelerated_files=4000'; \
      echo 'opcache.revalidate_freq=60'; \
      echo 'opcache.fast_shutdown=1'; \
      echo 'opcache.enable_cli=1'; \
      } > /etc/opt/rh/rh-php56/php.d/11-opcache-wordpress.ini

COPY s2i/bin/* $STI_SCRIPTS_PATH/
COPY contrib/* /opt/app-root/src/

USER 1001
VOLUME /opt/app-root/src/wordpress
CMD $STI_SCRIPTS_PATH/assemble
