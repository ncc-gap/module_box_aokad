FROM debian:9.11

MAINTAINER Ai Okada <aokada@ncc.go.jp>

RUN apt-get -y update && \
    apt-get install -y wget dpkg-dev gcc g++ libc6-dev make patch tar unzip zlib1g-dev libbz2-dev liblzma-dev autoconf autotools-dev libtool pkg-config git

##########
# bamUtil
RUN wget https://github.com/statgen/bamUtil/archive/master.zip && \
    unzip master.zip && \
    cd bamUtil-master && \
    make cloneLib && \
    make && \
    make install
 
##########
# Samtools
RUN wget https://github.com/samtools/samtools/releases/download/1.7/samtools-1.7.tar.bz2 && \
    tar jxvf samtools-1.7.tar.bz2 && \
    cd samtools-1.7 && \
    ./configure --without-curses && make && make install

ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

CMD ["/bin/bash"]
