FROM r-base:3.5.2
MAINTAINER aokada <aokada@ncc.go.jp>

# RUN: build
RUN apt-get -y update && \
    apt-get install -y libssl-dev libcurl4-openssl-dev libhdf5-dev &&\
    \
    Rscript -e "install.packages('devtools')" && \
    Rscript -e "devtools::install_github(repo = 'satijalab/seurat', ref = 'release/3.0')" && \
    Rscript -e "install.packages('dplyr')"

CMD ["/bin/bash"]
