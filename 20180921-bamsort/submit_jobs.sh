algo=bwa-mem
ecsub submit \
  --script ./scripts/${algo}.sh \
  --tasks ./scripts/${algo}-tasks.tsv \
  --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/ecsub/ \
  --wdir ./work/ \
  --image aokad/challenge-seeds:bamsort-20180831-bwa-0.7.8 \
  --aws-ec2-instance-type t2.2xlarge \
  --disk-size 22 \
  --task-name bwa-mem
    
algo=picard-sortsam
ecsub submit \
  --script ./scripts/${algo}.sh \
  --tasks ./scripts/${algo}-tasks.tsv \
  --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/ecsub/ \
  --wdir ./work/ \
  --image aokad/challenge-seeds:bamsort-20180831-picard-2.18.11 \
  --aws-ec2-instance-type t2.large \
  --disk-size 22 \
  --task-name picard
    
algo=samtools-sort-1.2
ecsub submit \
  --script ./scripts/${algo}.sh \
  --tasks ./scripts/${algo}-tasks.tsv \
  --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/ecsub/ \
  --wdir ./work/ \
  --image aokad/challenge-seeds:bamsort-20180831-samtools-1.2 \
  --aws-ec2-instance-type t2.large \
  --disk-size 22 \
  --task-name samtools-1-2

algo=samtools-sort-1.9
ecsub submit \
  --script ./scripts/${algo}.sh \
  --tasks ./scripts/${algo}-tasks.tsv \
  --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/ecsub/ \
  --wdir ./work/ \
  --image aokad/challenge-seeds:bamsort-20180831-samtools-1.9 \
  --aws-ec2-instance-type t2.large \
  --disk-size 22 \
  --task-name samtools-1-9

ecsub submit \
  --script ./scripts/biobambam-bamsort.sh \
  --tasks ./scripts/biobambam-bamsort-tasks.tsv \
  --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/ecsub/ \
  --wdir ./work/ \
  --image aokad/challenge-seeds:bamsort-20180831-biobambam-0.0.191 \
  --aws-ec2-instance-type t2.large \
  --disk-size 22 \
  --task-name biobambam-0-0-191

ecsub submit \
  --script ./scripts/biobambam-bamsort.sh \
  --tasks ./scripts/biobambam2-bamsort-tasks.tsv \
  --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/ecsub/ \
  --wdir ./work/ \
  --image aokad/challenge-seeds:bamsort-20180831-biobambam2-2.0.87 \
  --aws-ec2-instance-type t2.large \
  --disk-size 22 \
  --task-name biobambam2-2-0-87
