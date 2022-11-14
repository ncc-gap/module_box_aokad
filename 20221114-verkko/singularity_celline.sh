#!/bin/bash
set -euxo pipefail
source /opt/miniconda3/etc/profile.d/conda.sh

verkko -d ./output/celline --hifi /path/to/data/cellline/hifi-deepconsensus/rawdata/*.fastq.gz --nano /path/to/data/cellline/guppy/rawdata/*.fastq.gz
