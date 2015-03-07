FROM bmichalski/base

EXPOSE 3306:3306

RUN \
  base/configure-proxy.sh && \
  apt-get install -y \
    mariadb-server

COPY conf/root/configure.sh /root/configure.sh
COPY conf/root/on-startup.sh /root/on-startup.sh
COPY conf/root/run-debug.sh /root/run-debug.sh

RUN chmod u+x /root/configure.sh
RUN chmod u+x /root/on-startup.sh
RUN chmod u+x /root/run-debug.sh

CMD \
  /root/on-startup.sh
