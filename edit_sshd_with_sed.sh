#!/bin/bash

comment='ChallengeResponseAuthentication no'
uncomment='ChallengeResponseAuthentication yes'

# To comment line

sed -i "/${comment}/ s/^/#/" /etc/ssh/sshd_config


# To ucomment line

sed -i "/${uncomment}/ s/# *//" /etc/ssh/sshd_config
