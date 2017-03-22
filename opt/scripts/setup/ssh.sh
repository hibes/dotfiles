#!/bin/bash
#####Setup ssh server, and configure it
apt-get install -y openssh-server 

#Setup ssh
mkdir -p /var/run/sshd
sed -i 's/^AcceptEnv.*/AcceptEnv LANG LC_\* TMUX/' /etc/ssh/sshd_config

#Setup X11 forwarding
echo "X11Forwarding yes" >> /etc/ssh/sshd_config

