FROM broadinstitute/java-baseimage
MAINTAINER aokad <aokada@ncc.go.jp>

# Install ant, git for building
RUN apt-get update && \
    apt-get --no-install-recommends install -y --force-yes python2.7 python-pip \
    wget unzip ssl-cert ca-certificates && \
    apt-get clean autoclean && \
    apt-get autoremove -y 

# Assumes Dockerfile lives in root of the git repo. Pull source files into container
RUN mkdir /tools
WORKDIR /tools

# Build the distribution jar, clean up everything else
RUN wget https://github.com/broadinstitute/picard/releases/download/2.18.11/picard.jar

CMD ["/bin/bash"]
