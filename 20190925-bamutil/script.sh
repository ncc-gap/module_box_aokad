set -x

export INPUT_BAM=/external/DRP000987/DRR006374/DRR006374.Aligned.sortedByCoord.out.bam
export REFERENCE=/external/GRCh37/GRCh37.fa
export OUTPUT_DIR=/external
export SAMPLE=DRR006374

export OUTPUT_PREFIX=${OUTPUT_DIR}/${SAMPLE}

mkdir -p ${OUTPUT_DIR}
bam squeeze --in ${INPUT_BAM} --out ${OUTPUT_PREFIX}.bam --readName /dev/null --binQualS 10,20,30 
samtools view -@ 4 -C -T ${REFERENCE}  -o ${OUTPUT_PREFIX}.cram ${OUTPUT_PREFIX}.bam 
