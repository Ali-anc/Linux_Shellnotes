#!/bin/bash

### sar -u -f /var/log/sa/sa21 |egrep "02:20:01 PM|%iowait|Average" will give the following below
### CPU     %user     %nice   %system   %iowait    %steal     %idle 
### for the time speficed and the Average as of that point.
########################################################################################################

### sar -q -f /var/log/sa/sa07 |egrep "02:00:01 PM|ldavg-1|Average" will give the following below 
### runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked
### for the time speficed and the Average as of that point.

#Dec  06
sar -q -f /var/log/sa/sa06 |egrep "02:00:01 PM|ldavg-1|Average"

sar -u -f /var/log/sa/sa06 |egrep "02:00:01 PM|%iowait|Average"

#Dec  07
sar -q -f /var/log/sa/sa07 |egrep "02:00:01 PM|ldavg-1|Average"

sar -u -f /var/log/sa/sa07 |egrep "02:00:01 PM|%iowait|Average"

#Dec  08
sar -q -f /var/log/sa/sa08 |egrep "02:00:01 PM|ldavg-1|Average"

sar -u -f /var/log/sa/sa08 |egrep "02:00:01 PM|%iowait|Average"

#Dec  09
sar -q -f /var/log/sa/sa09 |egrep "02:00:01 PM|ldavg-1|Average"

sar -u -f /var/log/sa/sa09 |egrep "02:00:01 PM|%iowait|Average"

#Dec  10
sar -q -f /var/log/sa/sa10 |egrep "02:00:01 PM|ldavg-1|Average"

sar -u -f /var/log/sa/sa10 |egrep "02:00:01 PM|%iowait|Average"


### Example once in the dir.

 sar -q -f sa17

12:00:00 AM   runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked
12:10:00 AM         7      8682      6.50     10.28     10.48         0
12:20:00 AM         1      8551      7.56     10.19     10.49         0
12:30:00 AM         3      8486      8.23     10.98     10.98         0
12:40:00 AM         2      8493      4.81      9.04     10.42         0
12:50:00 AM         3      8462      7.65      9.91     10.46         0
01:00:00 AM         4      8332      7.14     10.95     11.15         3
01:10:00 AM        19      8098      8.51     12.55     12.48         0
01:20:00 AM         3      8044      7.68      9.93     11.25         0
01:30:00 AM         4      8118      6.40      8.70     10.12         0
01:40:00 AM         2      8180      6.57      8.80      9.78         0
01:50:00 AM         8      8146      6.23      8.63      9.44         0
02:00:00 AM        37      8161      5.65      8.55      9.23         0
02:10:00 AM         4      7791      9.34     15.98     15.19         1
08:00:00 PM         3     12941      5.91     10.21     11.37         0
08:10:00 PM         3     12710      6.50     10.82     11.51         0
08:20:00 PM        11     12310     11.10     11.46     11.50         0
08:30:00 PM         2     12126      6.24      8.81     10.36         0
Average:            7     12454      9.03     11.95     12.60         0
