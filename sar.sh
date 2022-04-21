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
