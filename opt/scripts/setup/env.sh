#!/bin/sh
export SOURCED_ENV_SH=1

##### Set OS
#######################################################
if [ $(uname) == "Darwin" ]; then
  export OS='mac'
elif [ $(uname) == "CYGWIN" ]; then
  export OS='win'
else
  export OS='nix'
fi

##### Set variables related to optional programs
#######################################################
export CUSTOM_PROGRAMS_DIR=/opt/local/
export CUSTOM_PROGRAMS_BINARY_DIR=/opt/local/bin/
export CUSTOM_SCRIPTS_DIR=/opt/scripts/
export CUSTOM_SETUP_SCRIPTS_DIR=/opt/scripts/setup/

##### Set docker variables
#######################################################
case $OS in
'mac'*)
  export DOCKER_PROGRAMMING_DIR=/Volumes/programming/
  ;;
'win'*)
  export DOCKER_PROGRAMMING_DIR=/TODO/
  ;;
'nix'*)
  export DOCKER_PROGRAMMING_DIR=/mnt/programming/
  ;;
esac
