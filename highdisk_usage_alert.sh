#! /bin/bash

email=myemail@example.com
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`
logfile=/tmp/usage.log

# Only allow the script to be run by the root user
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi
echo " $TIMESTAMP disk partition has reached greater than 70% " >> ${logfile}

df_usage=$(df -Ph | grep -vE '^tmpfs|cdrom'   |  awk '{print $5, $6}' | cut -d'%' -f1)
if [ $usage -ge 70 ]; then
	# get the list of dir with high usage
	 du_output=$(du -h --max-depth=1 /  | sort -hr)
	 
message="The disk usage of / directory is high.\n\nCurrent Usage: $df_usage%\n\n A list of the directories with the highest usage in /:\n\n$du_output"

echo -e "$message" | mail -s "High Disk Usage in / directory on $(hostname) at $(date)" $email

fi
