FROM ubuntu:14.04

MAINTAINER Benjamin Michalski <benjamin.michalski@gmail.com>

WORKDIR /root

RUN \
  apt-get update && \
  apt-get install -y \
    mariadb-server

COPY conf/root/configure.sh /root/configure.sh
COPY conf/root/on-startup.sh /root/on-startup.sh

RUN chmod u+x /root/configure.sh
RUN chmod u+x /root/on-startup.sh

EXPOSE 3306

CMD \
  /root/on-startup.sh
