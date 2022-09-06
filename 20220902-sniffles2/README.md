## Run sniffles2

```
mkdir $PWD/image $PWD/log
singularity pull $PWD/image/sniffles2_2.0.7.sif docker://aokad/sniffles2:2.0.7
```

Submit

```
qsub ./sniffles2.sh /path/to/input/tumor.bam /path/to/tumor.vcf
qsub ./sniffles2.sh /path/to/input/control.bam /path/to/control.vcf
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
qsub ./sniffles2_filt.sh /path/to/tumor.vcf /path/to/control.vcf /path/to/output/
```

see `${OUTPUT_DIR}/sniffles_sv.rmdup.txt`
