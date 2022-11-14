#!/bin/bash
#
# Set SGE
#
#$ -S /bin/bash         # set shell in UGE
#$ -cwd                 # execute at the submitted dir
#$ -e ./log/
#$ -o ./log/
#$ -j y
#$ -l s_vmem=18G
#$ -pe def_slot 8
set -x

/usr/local/package/singularity/3.7.3/bin/singularity exec --bind /path/to/data/cellline/hifi-deepconsensus/rawdata/,/path/to/data/cellline/guppy/rawdata ./image/verkko_1.2.sif \
bash ./singularity_celline.sh
