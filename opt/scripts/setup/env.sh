#!/bin/sh

if [ $(uname) == "Darwin" ]; then
  export OS='mac'
elif [ $(uname) == "CYGWIN" ]; then 
  export OS='win'
else
  export OS='nix'
fi
