# set -x

echo ${bai}
echo ${fai}

mkdir -p ${output_dir}
svviz --type batch --export ${output_dir} --format png ${options} -b ${bam} ${fa} ${vcf}

## vcf-format, see https://svviz.readthedocs.io/en/latest/batchmode.html#batch-mode
