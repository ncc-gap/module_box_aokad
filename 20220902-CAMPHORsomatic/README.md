## Run CAMPHORsomatic

```
mkdir $PWD/image $PWD/log
singularity pull $PWD/image/camphor_somatic_20220902.sif docker://aokad/camphor_somatic:20220902
```

Submit

```
REFERENCE=/path/to/reference.fa
qsub -N camphor ./camphor_svcall.sh /path/to/input/tumor.bam /path/to/tumor_dir ${REFERENCE}
qsub -N camphor ./camphor_svcall.sh /path/to/input/control.bam /path/to/control_dir ${REFERENCE}
qsub -hold_jid camphor ./camphor_comparision.sh \
    /path/to/tumor_dir \
    /path/to/control_dir \
    /path/to/input/tumor.bam \
    /path/to/input/control.bam \
    /path/to/input/tumor.fastq \
    /path/to/output_dir
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
qsub ./camphor_filt.sh /path/to/tumor.vcf /path/to/output/
```

see `${OUTPUT_DIR}/camphor_sv.rmdup.txt`
