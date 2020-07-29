# Pull base image
FROM ubuntu:18.04
# Install
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y sane sane-utils libsane-extras 

# Define default command.
CMD ["saned"]

