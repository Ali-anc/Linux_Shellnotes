#!/bin/bash

 systemctl status site24x7monagent.service |grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo systemctl restart site24x7monagent.service > /dev/null
fi
# Add this in your crontab */30 * * * * /usr/local/scripts/restart_site24x7_agent.sh > > /dev/null 2>&1
