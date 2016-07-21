FROM ubuntu:16.04

MAINTAINER Jared Feng <github@indeed.moe>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y transmission-daemon
    
RUN service transmission-daemon stop

ADD files/transmission-daemon /etc/transmission-daemon
ADD files/run_transmission.sh /run_transmission.sh

RUN mkdir -p /var/lib/transmission-daemon/incomplete && \
    mkdir -p /var/lib/transmission-daemon/downloads && \
    chown -R root:root /var/lib/transmission-daemon && \
    chown -R root:root /etc/transmission-daemon    

VOLUME ["/var/lib/transmission-daemon/downloads"]
VOLUME ["/var/lib/transmission-daemon/incomplete"]
VOLUME ["/etc/transmission-daemon/resume"]
VOLUME ["/etc/transmission-daemon/torrents"]

EXPOSE 9091
EXPOSE 12345

USER root

CMD ["/run_transmission.sh"]
