#!/bin/bash

USERS=$@

# Install emacs
apt-get install -y emacs

for user in $USERS; do
  # clone emacs repo, and run first time setup
  su - -c 'cd $HOME && \
  git clone --recursive https://github.com/kevinjohnston/.emacs.d.git && \
  /bin/bash -ilc emacs' $user  
done
