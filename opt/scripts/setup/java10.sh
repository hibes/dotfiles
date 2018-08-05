#!/bin/bash

##### constants
#######################################################
USE_THIS_VERSION_AS_DEFAULT_JAVA=${1:-1}



##### installation
#######################################################
# Needed to add ubuntu keyserver
apt-get install -y gnupg

# Install Oracle Java 10 (JDK 10) in Debian
echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu bionic main" | tee /etc/apt/sources.list.d/linuxuprising-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A
apt-get update
apt-get install -y oracle-java10-installer

# Accept the Oracle Java 10 license without user input
echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

if [ "$USE_THIS_VERSION_AS_DEFAULT_JAVA" -gt 0 ]; then
  apt-get install -y oracle-java10-set-default
else
  apt-get remove -y oracle-java10-set-default
fi



##### See Also:
#######################################################
# https://www.linuxuprising.com/2018/04/install-oracle-java-10-jdk-10-in-debian.html
