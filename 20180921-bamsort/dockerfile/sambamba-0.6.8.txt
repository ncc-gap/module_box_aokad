FROM debian:8.11
MAINTAINER aokad <aokada@ncc.go.jp>

# Install ant, git for building
RUN apt-get update && \
    apt-get --no-install-recommends install -y --force-yes python2.7 python-pip \
    wget ssl-cert ca-certificates \
    tar bzip2 \
    make g++ zlib1g-dev  libncurses5-dev libbz2-dev liblzma-dev && \
    apt-get clean autoclean && \
    apt-get autoremove -y 

RUN mkdir /tools
WORKDIR /tools

RUN wget -nc https://sourceforge.net/projects/samtools/files/samtools/1.9/samtools-1.9.tar.bz2 && \
    tar xjvf samtools-1.9.tar.bz2 && \
    rm -f samtools-1.9.tar.bz2 && \
    cd /tools/samtools-1.9 && \
    make && \
    make install && \
    \
    cd /tools && \
    wget -nc https://github.com/samtools/bcftools/releases/download/1.9/bcftools-1.9.tar.bz2 && \
    tar xjvf bcftools-1.9.tar.bz2 && \
    rm -f bcftools-1.9.tar.bz2 && \
    cd bcftools-1.9 && \
    make && \
    cp ./bcftools /usr/local/bin/ && \
    \
    cd /tools && \
    wget https://github.com/biod/sambamba/releases/download/v0.6.8/sambamba-0.6.8-linux-static.gz && \
    gzip -d sambamba-0.6.8-linux-static.gz && \
    chmod 755 sambamba-0.6.8-linux-static && \
    cp sambamba-0.6.8-linux-static /usr/local/bin/sambamba

CMD ["/bin/bash"]

