#!/bin/bash

#####Setup sudo
apt-get install -y sudo

#Add each passed in user to the sudo group
for NEW_USER in "$@"
do
    usermod -a -G sudo "$NEW_USER"
done


