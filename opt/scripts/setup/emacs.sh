#!/bin/bash

EMACS_VERSION=${1:-25}
USERS=${@:2}

# Install emacs
apt-get install -y emacs$EMACS_VERSION

for user in $USERS; do
  # Remove emacs.d if present
  rm -rf "$HOME/.emacs.d/"

  # clone emacs repo, and run first time setup
  su - -c 'cd $HOME && \
  git clone --recursive https://github.com/kevinjohnston/.emacs.d.git && \
  emacs --batch -l $HOME/.emacs.d/init.el' $user  
done
