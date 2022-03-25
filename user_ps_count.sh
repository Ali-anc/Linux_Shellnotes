#!/bin/bash

numberOfInstances=$(ps -efL | grep user101 |egrep -v 'grep|root' | wc -l)
logfile=/tmp/pswarning.log
email_addr=user101@example.com
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

if (( numberOfInstances > 3 ))
then               
        echo " $TIMESTAMP you have more than 3 user101 processes with mutli threads" >> ${logfile}
        mail -s "The soft nproc limit has reached for $(hostname)" ${email_addr} <<< "This is an automated alert, please increase nproc limit."
        exit 0
else
        echo " nope this is less than 1 "
fi
# add the following in your crontab */1 * * * * /usr/local/script/psusercount.sh >> /tmp/pswarning.log
