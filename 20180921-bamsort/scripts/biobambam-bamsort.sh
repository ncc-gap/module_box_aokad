#!/bin/bash

set -eux

export LD_LIBRARY_PATH=/usr/local/lib

mkdir -p ${OUTPUT_DIR}

${BIOBAMBAM_PREFIX}/bamsort \
    I=${INPUT_SAM} \
    ${BAMSORT_OPTION} \
    calmdnmreference=${REFERENCE}/GRCh37.fa \
    inputformat=sam \
    indexfilename=${OUTPUT_DIR}/${OUTPUT_NAME}.bai \
    O=${OUTPUT_DIR}/${OUTPUT_NAME}

<< COMMENTOUT

--env BIOBAMBAM_PREFIX	/usr/local/bin
--env BAMSORT_OPTION	index=1 level=1 inputthreads=2 outputthreads=2 calmdnm=1 calmdnmrecompindentonly=1
--input-recursive REFERENCE	s3://genomon-bucket/_GRCh37/reference/GRCh37
--input INPUT_SAM	s3://aokad-ana-bucket/challenge/bamsort-20180831/bam/5929_tumor.sam
--output-recursive OUTPUT_DIR	s3://aokad-ana-bucket/challenge/bamsort-20180831/biobambam-0.0.191/
--env OUTPUT_NAME	5929_tumor.sorted.bam

<< COMMENTOUT
