#!/bin/bash

#Setup minimum prerequisites for the most essential other scripts
USER="$1"

umask 002
apt-get install -y git
apt-get install -y python3
#mkdir -p /tmp/scripts /opt/scripts /opt/bin; git clone https://github.com/kevinjohnston/scripts.git /tmp/scripts; cd /tmp/scripts; git archive --format=tar -o /tmp/scripts.tar master; tar -x -C /opt/scripts -f /tmp/scripts.tar
#chmod +x /opt/scripts/*
#chown -R "$USER:$USER" /opt/bin/
#chown -R "$USER:$USER" /opt/scripts/
