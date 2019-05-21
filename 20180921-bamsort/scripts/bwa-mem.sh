#!/bin/bash

set -eux

/tools/bwa-0.7.8/bwa mem \
    ${BWA_OPTION} \
    ${REFERENCE}/GRCh37.fa \
    ${FASTQ1} \
    ${FASTQ2} \
    > ./alignment.sam

mkdir -p $(dirname ${OUTPUT_SAM})
mv ./alignment.sam ${OUTPUT_SAM}

<< COMMENTOUT
--env BWA_OPTION	-t 8 -T 0
--input-recursive REFERENCE	s3://genomon-bucket/_GRCh37/reference/GRCh37

--input FASTQ1	s3://genomon-bucket/sample/exome/5929_tumor/sequence1.fastq
--input FASTQ2	s3://genomon-bucket/sample/exome/5929_tumor/sequence2.fastq

--output OUTPUT_SAM	s3://aokad-ana-bucket/challenge/bamsort-20180831/bam/5929_tumor.sam
COMMENTOUT

