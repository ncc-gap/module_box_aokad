#!/bin/bash
#
# Set SGE
#
#$ -S /bin/bash         # set shell in UGE
#$ -cwd                 # execute at the submitted dir
#$ -e ./log/
#$ -o ./log/
#$ -j y
#$ -l s_vmem=80G

set -eux

TUMOR_DIR=$1
CONTROL_DIR=$2
TUMOR_BAM=$3
CONTROL_BAM=$4
TUMOR_FASTQ=$5
OUTPUT_DIR=$6

mkdir -p ${OUTPUT_DIR}

singularity exec $PWD/image/camphor_somatic_20220902.sif \
    bash $PWD/shell_camphor_comparision.sh ${TUMOR_DIR} ${CONTROL_DIR} ${TUMOR_BAM} ${CONTROL_BAM} ${TUMOR_FASTQ} ${OUTPUT_DIR}
