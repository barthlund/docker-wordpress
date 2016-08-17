WordPress Docker Image
==================

This repository contains Dockerfile to run WordPress on AusNimbus (OpenShift v3).

Note: A volume is created in in the WordPress root directory. This image designed
to be a quickstart for deploying a fully functional Wordpress installation.
It is not scalable unless you use a Read+Write+Many storage backend (such as NFS or GlusterFS).

Configuring
-----------

The image requires a linked MySQL service, we pre-configure a configuration file if the
the required environment variables are set.

- MYSQL_DATABASE
- MYSQL_USER
- MYSQL_PASSWORD
- DATABASE_SERVICE_NAME

WordPress is installed into the /wordpress sub directory. You change the document root by
setting the DOCUMENTROOT environment variable eg. /wordpress

You can define the your WordPress version by setting the ENV variables.
The default WordPress version is 4.6

- WORDPRESS_VERSION
- WORDPRESS_SHA1 (the sha1sum of the upstream .tar.gz)

Running Locally
---------------

To build and run locally, execute:

    git clone https://github.com/ausnimbus/docker-wordpress
    docker build -t wordpress:ausnimbus .
    docker run -d wordpress:ausnimbus
