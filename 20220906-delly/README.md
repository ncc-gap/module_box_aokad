## Run delly

```
mkdir $PWD/image $PWD/log
wget https://github.com/dellytools/delly/releases/download/v1.0.3/delly_v1.0.3.sif -O ./image/delly_v1.0.3.sif
```

Submit

```
REFERENCE=/path/to/reference.fa
qsub ./delly.sh /path/to/input/tumor.bam /path/to/tumor.bcf ${REFERENCE}
qsub ./delly.sh /path/to/input/control.bam /path/to/control.bcf ${REFERENCE}
```

## Filt output.vcf

```
singularity pull ./image/ob_utils_0.0.12.sif docker://aokad/ob_utils:0.0.12
singularity pull ./image/simulationsv-set_0.1.0.sif docker://aokad/simulationsv-set:0.1.0

# download scripts
wget https://github.com/ncc-ccat-gap/simulation_sv_set/archive/refs/tags/v0.2.0.zip
unzip v0.2.0.zip
mv simulation_sv_set-0.2.0 simulation_sv_set
```

Submit

```
qsub ./delly_filt.sh /path/to/tumor.bcf /path/to/control.bcf /path/to/output/
```

see `${OUTPUT_DIR}/delly_sv.rmdup.txt`
