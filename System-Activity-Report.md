# Sar - System Activity Report

In this page you will see brief findings related to SAR cmd.
Useful Linux CLI tool for monitoring Linux resources, and very useful for providing information without having to monitor it live. Please read sar man to get more info. 

>The following below are some Flags or options used with sar command.

`-q = Report queue length and load averages`

`-u = Report CPU utilization. The ALL keyword indicates that all the CPU fields should be displayed.`

`-f = extract information from the file location provided. The default value of the filename parameter is the current daily data file, the /var/log/sa/sadd file.` 

The following below will  output ldavg 1-15 
```
sar -q -f /var/log/sa/sa# 
```
The following below will output the following %user,%nice,%syste,%iowait,%steal,& %idle, ldavg & Average.
```
sar -u -f /var/log/sa/sa# 
```

```
sar -u -f /var/log/sa/sa#dateofmonth |egrep "12:30:03 PM|%iowait|Average"
```

```
sar -q -f /var/log/sa/sa#dateofmonth |egrep "12:30:29 PM|ldavg|Average"
```


> The following below is useful cmd/flag to find the following
```
sar -S 
```

_kbswpfree and kbswpused._

_Checks for Swap mem used and free_

> The following below isuseful cmd/flag to find the following

sar -r 

_kbmemfree + kbcached + kbbuffer = available mem_

_The kbbuffers and kbcached columns correspond to the buffers and cache columns in free_

_kbmemfree is the same as the free column in the output of free._

_kbmemused is the sum of the used and buff/cache columns in free_
