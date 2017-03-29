#!/usr/bin/env python3
'''Appends machine specific bash_aliases file to default .bash_aliases file'''

import os
import subprocess
import sys

#Hook filenames
pre_stow_hook='pre_stow_hook.py'
post_stow_hook='post_stow_hook.py'

machine=sys.argv[1]
user=sys.argv[2]
usr_home_path=sys.argv[3]

dotfiles_path=usr_home_path + '/dotfiles/bash/'

if os.path.isfile(dotfiles_path + '.bash_aliases.' + machine):
  # open .bash_aliases and the machine specific .bash_aliases
  f_default = open(dotfiles_path + '.bash_aliases', 'ab')
  f_machine = open(dotfiles_path + '.bash_aliases.' + machine, 'rb')
  
  # append to bash_aliases
  f_default.write(f_machine.read())
  
  # close open file handles
  f_machine.close()
  f_default.close()
