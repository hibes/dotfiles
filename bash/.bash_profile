##### Sourced for login shells
# Should:
# load .profile, as bash will not load it when this file is present

# Should not:
# setup variables only appropriate to interactive shells

# This file only exists to force loading of other .bash* files 
# For some reason debian has incorrectly decided that shouldn't happen when running /bin/bash

# if .bash_profile exists, bash doesn't read .profile by default
if [[ -f ~/.profile ]]; then
  . ~/.profile
fi

# if .bashrc exists load it, and let it determine if the shell is interactive or not
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi
