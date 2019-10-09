#!/bin/bash
set -x
set -o errexit
set -o nounset

OUTPUT_PREF=${OUTPUT_DIR}/${SAMPLE}
mkdir -p ${OUTPUT_DIR}

featureCounts -T 4 -p -a ${GTF} -O -B -C -o ${OUTPUT_PREF}.txt ${INPUT}
python /tools/simple_exp/proc_fc.py ${OUTPUT_PREF}.txt ${OUTPUT_PREF}.txt.summary ${GTF} > ${OUTPUT_PREF}.txt.fpkm
