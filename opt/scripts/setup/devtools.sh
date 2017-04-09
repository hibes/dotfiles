#!/bin/bash
USER="$1"

##### NOTES
#######################################################
# Requires that common environment variables have been defined

. /opt/scripts/setup/env.sh

if [ -n "$SOURCED_ENV_SH" ]; then
  
  ##### Setup emacs
  #######################################################
  /opt/scripts/setup/emacs.sh $USER >/dev/null 2>&1
  
  ##### Setup eclipse
  #######################################################
  echo 'Setting up Eclipse...'
  wget http://eclipse.mirror.rafal.ca/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz -P /tmp/ -q >/dev/null 2>&1
  tar -xf /tmp/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz -C ${CUSTOM_PROGRAMS_DIR}
  echo 'done'
  
  ##### Setup redis-cli
  #######################################################
  echo 'Setting up redis-cli...'
  apt-get install -y redis-tools
  echo 'done'

else 
  echo '##### Catastrophic failure, env.sh has not been sourced'
  echo '#######################################################'
  exit 1
fi
