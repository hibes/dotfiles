#!/bin/bash

echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | \
  tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | \
  tee -a /etc/apt/sources.list.d/webupd8team-java.list

echo "debconf shared/accepted-oracle-license-v1-1 select true" | \
  debconf-set-selections
echo "debconf shared/accepted-oracle-license-v1-1 seen true" | \
  debconf-set-selections

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update

# Patch to fix oracle stupidity
cd /var/lib/dpkg/info
sed -i 's|JAVA_VERSION=8u144|JAVA_VERSION=8u153|' oracle-java8-installer.*
sed -i 's|PARTNER_URL=http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/|PARTNER_URL=http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz?AuthParam=1516561891_4e84f9ec12deb7ae0c3dcf584b4cca38|' oracle-java8-installer.*
sed -i 's|J_DIR=jdk1.8.0_144|J_DIR=jdk1.8.0_153|' oracle-java8-installer.*

apt-get -y install oracle-java8-installer
apt-get -y install oracle-java8-set-default
