# Specifing the base image
FROM           vaibhavtodi/debian-java:latest

# Maintainer
MAINTAINER     "Vaibhav Todi"  <vaibhavtodi1989@gmail.com>

# Specifing the Label
LABEL          Description="Graylog Collector Docker image"                                                                                     \
               Version="1.0"

# Setting the Environment
ENV            JAVA            /usr/lib/jvm/java-8-oracle

# Downloading & Installing the Graylog-Collector
RUN            wget            https://packages.graylog2.org/repo/packages/graylog-collector-latest-repository-debian8_latest.deb               \
      &&       dpkg     -i     graylog-collector-latest-repository-debian8_latest.deb                                                           \
      &&       apt-get         update                                                                                                           \
      &&       apt-get         install   -y  apt-transport-https                                                                                \
      &&       apt-get         upadte                                                                                                           \
      &&       apt-get         install   -y  graylog-collector                                                                                  \
      &&       rm       -f     graylog-collector-latest-repository-debian8_latest.deb

# Setting up Graylog Collector

# Cleaning up the Image
RUN            apt-get          clean                                                                                                            \
      &&       rm       -rf     /var/lib/apt/lists/*

# Copying the Graylog Collector configuration file
COPY           graylog

# Copying the entrypoint.sh for running the service
COPY           entrypoint.sh        /entrypoint.sh

# Exposing the Ports
EXPOSE         443       443/udp          \
               514       514/udp

# Mounting the Volumes
VOLUME         ["/var/log/graylog-collector"]

# CMD instruction
CMD            ["/entrypoint.sh"]
