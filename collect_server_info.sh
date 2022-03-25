#! /bin/bash
uname -nrv
hostnamectl |egrep "Operating System:|Chassis:|Static hostname:"
lscpu |grep "CPU(s):"
sudo dmidecode |grep -A2 "^System Information"
cat /proc/meminfo |egrep "SwapTotal|MemTotal"
systemctl status firewalld |grep "Active:" 
sudo  firewall-cmd --list-all
systemctl status iptables
sestatus | grep "SELinux status:"
echo Public IP: ;  curl ifconfig.co
ip -4 a |grep inet
route
ip route 
lsblk
cat /etc/passwd | egrep "Moe|Wang|Marry|Tyrone"
sudo ls -la /home
