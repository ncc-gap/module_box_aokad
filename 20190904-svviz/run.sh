set -x

<< COMMENTOUT
  # parameters, example
  # ------------------
  # --input
  # ------------------
  # sorted and indexed bam
  export bam="s3://YOUR-BUCKET/sample1/tumor.bam"
  export bai="s3://YOUR-BUCKET/sample1/tumor.bam.bai"
  export bam2="s3://YOUR-BUCKET/sample1/control.bam"     # optional
  export bai2="s3://YOUR-BUCKET/sample1/control.bam.bai" # optional
  
  # reference genome
  export fa="s3://YOUR-BUCKET/reference/GRCh37.fa"
  export fai="s3://YOUR-BUCKET/reference/GRCh37.fa.fai"
  
  # vcf file
  export vcf="s3://YOUR-BUCKET/variants.vcf"
  # vcf-format, see https://svviz.readthedocs.io/en/latest/batchmode.html#batch-mode
  
  # ------------------
  # --output-recursive
  # ------------------
  export output_dir="s3://YOUR-BUCKET/output"
  
  # ------------------
  # --env
  # ------------------
  # svviz option
  export options="--sample-reads 1000"  # optional
COMMENTOUT

mkdir -p ${output_dir}
if [ -n "${bam2}" ]; then
    svviz --type batch --export ${output_dir} --format png ${options} -b ${bam} -b ${bam2} ${fa} ${vcf}
else
    svviz --type batch --export ${output_dir} --format png ${options} -b ${bam} ${fa} ${vcf}
fi
