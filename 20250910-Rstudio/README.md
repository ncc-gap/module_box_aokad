apptainer image
```
$ ssh shirokane
$ qlogin s_vmem=28G
$ apptainer pull docker://aokad/rstudio:amedhandson
$ exit
```

Rstudio server
```
$ ssh shirokane
$ qlogin
$ PASSWORD='<PASSWORD>' apptainer exec --bind run:/run,var-lib-rstudio-server:/var/lib/rstudio-server,database.conf:/etc/rstudio/database.conf  rstudio_amedhandson.sif /usr/lib/rstudio-server/bin/rserver --auth-none=0 --auth-pam-helper-path=pam-helper --server-user=<YOUR SHIROKANE's USER NAME> --www-address=localhost --www-port 8787
```

Browser
```
$ ssh shirokane -X
$ qlogin -l s_vmem=24G
$ ssh <Rstudio server が起動しているノード> -X
$ firefox
# locallhost:8787 に接続し、<YOUR SHIROKANE's USER NAME> <PASSWORD> でログインする
```
