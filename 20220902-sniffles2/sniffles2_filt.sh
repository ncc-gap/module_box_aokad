#!/bin/bash
#
# Set SGE
#
#$ -S /bin/bash         # set shell in UGE
#$ -cwd                 # execute at the submitted dir
#$ -e ./log/
#$ -o ./log/
#$ -j y
#$ -l s_vmem=1G
#$ -pe def_slot 8

set -eux

TUMOR_VCF=$1
CONTROL_VCF=$2
OUTPUT_DIR=$3

mkdir -p ${OUTPUT_DIR}

# somatic filter with controls + convert to nanomonsv format
singularity exec $PWD/image/ob_utils_0.0.12.sif \
    ob_utils sniffles_sv \
        --in_sniffles_tumor_sv ${TUMOR_VCF} \
        --in_sniffles_control_sv ${CONTROL_VCF} \
        --output ${OUTPUT_DIR}/sniffles_sv.txt \
        --filter_scaffold_option \
        --f_grc --margin 200 --max_control_support_read 0 --sniffles2

# filtering
singularity exec $PWD/image/simulationsv-set_0.1.0.sif  \
    python3 $PWD/simulation_sv_set/script/rmdup.py \
        ${OUTPUT_DIR}/sniffles_sv.txt > \
        ${OUTPUT_DIR}/sniffles_sv.rmdup.txt
