# Set up

AWStats
```
wget https://prdownloads.sourceforge.net/awstats/awstats-7.9.zip
unzip awstats-7.9.zip
cp awstats-7.9/wwwroot/cgi-bin/awstats.model.conf awstats-7.9/wwwroot/cgi-bin/awstats.root.conf
# edit awstats.root.conf
```

httpd
```
docker build -t awstats -f Dockerfile.txt .
docker run -it -v $PWD:/work -p 8080:8080 awstats bash
docker> cp -r /work/awstats-7.9/wwwroot/cgi-bin /usr/local/apache2/
docker> httpd -k start
```
