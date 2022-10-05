## Run cuteSV

```
mkdir $PWD/image $PWD/log
singularity pull $PWD/image/cutesv_2.0.0.sif docker://aokad/cutesv:2.0.0
```

Submit

```
REFERENCE=/path/to/reference.fa
qsub ./cutesv.sh /path/to/input/tumor.bam /path/to/tumor.vcf ${REFERENCE}
qsub ./cutesv.sh /path/to/input/control.bam /path/to/control.vcf ${REFERENCE}
```

## Filt output.vcf

```
singularity pull ./image/ob_utils_0.0.12a.sif docker://aokad/ob_utils:0.0.12a
singularity pull ./image/simulationsv-set_0.1.0.sif docker://aokad/simulationsv-set:0.1.0

# download scripts
wget https://github.com/ncc-ccat-gap/simulation_sv_set/archive/refs/tags/v0.2.0.zip
unzip v0.2.0.zip
mv simulation_sv_set-0.2.0 simulation_sv_set
```

Submit

```
qsub ./cutesv_filt.sh /path/to/tumor.vcf /path/to/control.vcf /path/to/output/
```

see `${OUTPUT_DIR}/cutesv_sv.rmdup.txt`
