#!/bin/bash

set -eux

export LD_LIBRARY_PATH=/usr/local/lib
mkdir -p ${OUTPUT_DIR}

samtools view -bS ${INPUT_SAM} > ./temp.bam
samtools sort ./temp.bam -o ${OUTPUT_DIR}/${OUTPUT_NAME}
samtools index ${OUTPUT_DIR}/${OUTPUT_NAME}

<< COMMENTOUT

--input INPUT_SAM	s3://aokad-ana-bucket/challenge/bamsort-20180831/bam/5929_tumor.sam
--output-recursive OUTPUT_DIR	s3://aokad-ana-bucket/challenge/bamsort-20180831/samtools-1.2
--env OUTPUT_NAME	5929_tumor.sorted.bam

<< COMMENTOUT
