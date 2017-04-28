FROM       centos:centos7
MAINTAINER mussyg52

# Fix broken link for /var/lock
RUN mkdir -p /run/lock/subsys

# Update RPM Packages
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install transmission-daemon; yum clean all
RUN yum -y install initscripts; yum clean all
RUN rpm -Uvh https://downloads.plex.tv/plex-media-server/1.5.5.3634-995f1dead/plexmediaserver-1.5.5.3634-995f1dead.x86_64.rpm; echo 'avoiding error'
RUN mkdir /config && \
    mkdir /data && \
    chown plex:plex /config && \
    chown plex:plex /data 
RUN mkdir -p /root/Downloads
VOLUME ["/config"]
VOLUME ["/data"]

ADD PlexMediaServer /etc/sysconfig/PlexMediaServer
ADD settings.json /root/.config/transmission-daemon/settings.json
ADD start.sh /start.sh

EXPOSE 32400
EXPOSE 9091

CMD ["/bin/bash", "/start.sh"]
