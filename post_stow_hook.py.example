#!/usr/bin/env python3
'''Removes this file and uneeded .vimrc config files'''

import os
import subprocess
import sys
import glob

#Hook filenames
pre_stow_hook='pre_stow_hook.py'
post_stow_hook='post_stow_hook.py'

machine=sys.argv[1]
user=sys.argv[2]

usr_home_path="/home/" + user + "/"
dotfiles_dot_path=usr_home_path + "dotfiles/vim/"

#remove hooks
if os.path.isfile(dotfiles_dot_path + pre_stow_hook):
  os.remove(usr_home_path + pre_stow_hook)

if os.path.isfile(dotfiles_dot_path + post_stow_hook):
  os.remove(usr_home_path + post_stow_hook)

#remove unneeded vimrc files
for fil in glob.glob(dotfiles_dot_path + ".vimrc.*"):
  os.remove(fil)
