#!/bin/bash

USERS=$@

# Install emacs
apt-get install -y emacs25

for user in $USERS; do
  # Remove emacs.d if present
  rm -rf "$HOME/.emacs.d/"

  # clone emacs repo, and run first time setup
  su - -c 'cd $HOME && \
  git clone --recursive https://github.com/kevinjohnston/.emacs.d.git && \
  emacs --batch -l $HOME/.emacs.d/init.el' $user  
done
