# Pull base image
FROM ubuntu:20.04
# Install
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y \
    sane \
    sane-utils \
    libsane-extras \
    libsane-hpaio \
    dbus \
    avahi-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN adduser saned scanner \
    && adduser saned lp \
    && chown saned:lp /etc/sane.d/saned.conf



# Define default command.
CMD ["/usr/sbin/saned -e -u saned"]

EXPOSE 6566
