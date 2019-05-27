set -x

mkdir -p {OUTPUT_DIR}

BIN_DIR=/user/local/nanomon-sv-v0.0.1

if [ -n "$INPUT_BAM" ]; then
then
    python ${BIN_DIR}/run-nanomon-sv.py parse -i ${INPUT_BAM} -o ${OUTPUT_DIR}/${SAMPLE} 
    INPUT_JUNCTION=${OUTPUT_DIR}/${SAMPLE}.junction.sort.gz
fi

if [ -n "$INPUT_BP" ]; then
then
    python ${BIN_DIR}/run-nanomon-sv.py fetch --input_bp ${INPUT_BP} --parsed_file ${INPUT_JUNCTION} --output_prefix ${OUTPUT_DIR}/${SAMPLE}.fetch
fi

