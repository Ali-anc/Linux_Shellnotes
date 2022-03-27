#!/bin/bash

# Prompt user for IP Networks by echo-ing and using "read" for reading output as var. -n = not empty string 
echo -n "Enter IP Network or IP Address. EX: 192.168.50.4 or 192.168.50.0: "
read  IPNetwork
echo -n " Enter IP CIDR. EX: /24 (255.255.255.0) or /28 ( 255.255.255.240): "
read CIDR
echo -n "Enter the port number you would like to scan for: "
read port
# network mapper - Exploration tool / port scanner.
# -sT (TCP connect scan) 
# $IPNetwork and $CIDR are variables 
# > /dev/null, redirect the output to /dev/null, which discards it, instead of stdout ( file descritors)
# -oG portscan, filespec (grepable output) to portscan filr
# use nmap man to get further info
nmap -sT $IPNetwork$CIDR -p $port  > /dev/null -oG portscan
# cat portscan file extended grep and excluding "Status" in the search pattern.
cat portscan |egrep "Host|Port" |grep -v "Status"
