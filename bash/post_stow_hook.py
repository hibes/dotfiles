#!/usr/bin/env python3
'''Removes this file and uneeded .bash_aliases config files'''

import os
import subprocess
import sys
import glob

#Hook filenames
pre_stow_hook='pre_stow_hook.py'
post_stow_hook='post_stow_hook.py'

machine=sys.argv[1]
user=sys.argv[2]
usr_home_path=sys.argv[3]

dotfiles_dot_path=usr_home_path + "/dotfiles/bash/"

# remove hooks
if os.path.isfile(dotfiles_dot_path + pre_stow_hook) and os.path.isfile(usr_home_path + "/" + pre_stow_hook):
  os.unlink(usr_home_path + "/" + pre_stow_hook)

if os.path.isfile(dotfiles_dot_path + post_stow_hook) and os.path.isfile(usr_home_path + "/" + post_stow_hook):
  os.unlink(usr_home_path + "/" + post_stow_hook)

# remove unneeded vimrc files
for fil in glob.glob(dotfiles_dot_path + ".bash_aliases.*"):
  os.unlink(usr_home_path + "/" + os.path.basename(fil))
