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
OUTPUT_VCF=$2
REFERENCE=$3

OUTPUT_DIR=$(dirname ${OUTPUT_VCF})
mkdir -p ${OUTPUT_DIR}

singularity exec $PWD/image/cutesv_2.0.0.sif \
  cuteSV \
    ${INPUT_BAM} \
    ${REFERENCE} \
    ${OUTPUT_VCF} \
    ${OUTPUT_DIR} \
    --max_cluster_bias_INS 100 \
    --diff_ratio_merging_INS 0.3 \
    --max_cluster_bias_DEL 100 \
    --diff_ratio_merging_DEL 0.3 \
    --threads 8 \
    --min_support=1 
