# Truncate - shrink or extend the size of a file to the specified size

```
cd /usr/local/anc/logs
```
```
ls -lah

sudo truncate -s 0 ./general.log	s=size 0.   Empty the file
ls -lah

sudo truncate -s 0 ./licence.log	s=size 0.   Empty the file
```


> ### You can also use other units, such as K for kilobytes, M for megabytes, G for gigabytes, etc.
```
sudo truncate -s 2M license.log
```

> ### Issue the following cmd below to view the disk space
```
df -Th
```
`-T = print file system type`

`-h = print sizes in powers of 1024 (Human-readable)`

> ### man truncate for futher details
