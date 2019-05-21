FROM debian:8.11
MAINTAINER aokad <aokada@ncc.go.jp>

# Install ant, git for building
RUN apt-get update && \
    apt-get --no-install-recommends install -y --force-yes python2.7 python-pip \
    wget ssl-cert ca-certificates \
    tar bzip2 \
    make g++ zlib1g-dev && \
    apt-get clean autoclean && \
    apt-get autoremove -y 

RUN mkdir /tools
WORKDIR /tools

RUN wget http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.8.tar.bz2 && \
    tar xjvf bwa-0.7.8.tar.bz2 && \
    rm -f bwa-0.7.8.tar.bz2 && \
    cd /tools/bwa-0.7.8 && \
    make

CMD ["/bin/bash"]

