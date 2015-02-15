FROM ubuntu:14.04

COPY conf/root/detect-proxy.sh /root/detect-proxy.sh
COPY conf/root/configure-proxy.sh /root/configure-proxy.sh

RUN chmod u+x /root/detect-proxy.sh

ENV HOME /root

WORKDIR /root

EXPOSE 3306:3306

RUN \
  bash configure-proxy.sh && \
  apt-get update && \
  apt-get install -y \
    vim \
    mariadb-server

COPY conf/root/configure.sh /root/configure.sh
COPY conf/root/on-startup.sh /root/on-startup.sh
COPY conf/root/run-debug.sh /root/run-debug.sh

RUN chmod u+x /root/run-debug.sh

CMD \
  bash /root/on-startup.sh
