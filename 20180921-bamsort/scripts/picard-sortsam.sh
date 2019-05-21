#!/bin/bash

set -eux

RECORDS_IN_RAM=5000000

mkdir -p ${OUTPUT_DIR}

java -jar picard.jar SortSam \
R=${REFERENCE}/GRCh37.fa \
I=${INPUT_SAM} \
O=${OUTPUT_DIR}/${OUTPUT_NAME} \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=SILENT \
MAX_RECORDS_IN_RAM=${RECORDS_IN_RAM}

<< COMMENTOUT

--input-recursive REFERENCE	s3://genomon-bucket/_GRCh37/reference/GRCh37
--input INPUT_SAM	s3://aokad-ana-bucket/challenge/bamsort-20180831/bam/5929_tumor.sam
--output-recursive OUTPUT_DIR	s3://aokad-ana-bucket/challenge/bamsort-20180831/picard-2.18.11/
--env OUTPUT_NAME	5929_tumor.sorted.bam

COMMENTOUT
