## Run nanomonsv

```
mkdir $PWD/image $PWD/log
singularity pull ./image/nanomonsv_v0.5.0.sif docker://friend1ws/nanomonsv:v0.5.0
```

Submit

```
qsub -N nanomonsv_parse ./nanomonsv_parse.sh /path/to/input/tumor.bam /path/to/tumor/prefix
qsub -N nanomonsv_parse ./nanomonsv_parse.sh /path/to/input/control.bam /path/to/control/prefix

REFERENCE=/path/to/reference.fa
CONTROL_PANEL_PREFIX=/path/to/control_panel/prefix
qsub -hold_jid nanomonsv_parse ./nanomonsv_get.sh \
  /path/to/input/tumor.bam /path/to/input/control.bam \
  /path/to/tumor/prefix /path/to/control/prefix \
  ${REFERENCE} ${CONTROL_PANEL_PREFIX}
```

## Filt output.txt

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
qsub ./nanomonsv_filt.sh /path/to/tumor.txt /path/to/tumor.vcf /path/to/output/
```

see `${OUTPUT_DIR}/nanomonsv.result_rmdup.txt`
