# Setup database

```
mkdir path/to/famdb
wget -q https://www.dfam.org/releases/current/families/FamDB/dfam39_full.7.h5.gz -P /opt/RepeatMasker/Libraries/famdb/
gunzip /opt/RepeatMasker/Libraries/famdb/dfam39_full.7.h5.gz
```

With case apptainer
```
apptainer pull docker://aokad/repeatmasker:1.94
apptainer exec --bind path/to/famdb:/opt/RepeatMasker/Libraries/famdb/repeatmasker_1.94.sif RepeatMasker ${options}
```

