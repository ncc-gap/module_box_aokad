#!/bin/bash
#
# Set SGE
#
#$ -S /bin/bash         # set shell in UGE
#$ -cwd                 # execute at the submitted dir
#$ -e ./log/
#$ -o ./log/
#$ -j y
#$ -l s_vmem=4G
#$ -pe def_slot 8

set -eux

INPUT_BAM=$1
OUTPUT_BCF=$2
REFERENCE=$3

mkdir -p $(dirname ${OUTPUT_BCF})
singularity exec $PWD/image/delly_v1.0.3.sif \
  delly lr \
    -y ont -o ${OUTPUT_BCF} \
    -g ${REFERENCE} \
    ${INPUT_BAM}
