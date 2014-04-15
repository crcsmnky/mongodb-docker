# MongoDB
#
# VERSION 0.1

FROM centos:latest
MAINTAINER Sandeep Parikh <sandeep@clusterbeep.org>

# add MongoDB repository
ADD mongodb.repo /etc/yum.repos.d/mongodb.repo

# update system packages
RUN yum -q -y update

# install MongoDB
RUN yum -q -y install mongodb-org

# add MongoDB base settings
ADD mongod.conf /etc/mongod.conf

# set up the dbpath (optionally, connect to storage at runtime)
VOLUME ["/data"]

# start MongoDB (optionally, add other runtime MongoDB params)
ENTRYPOINT ["/usr/bin/mongod", "--config", "/etc/mongod.conf"]
