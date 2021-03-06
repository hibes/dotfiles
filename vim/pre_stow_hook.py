#!/usr/bin/env python3
'''Performs setup work before calling stow.'''

import os
import subprocess
import sys

#Hook filenames
pre_stow_hook='pre_stow_hook.py'
post_stow_hook='post_stow_hook.py'

machine=sys.argv[1]
user=sys.argv[2]
usr_home_path=sys.argv[3]

dotfiles_path=usr_home_path + "/dotfiles/vim/"

if os.path.isfile(dotfiles_path + ".vimrc." + machine):
  subprocess.call(["cp",
                   dotfiles_path + ".vimrc." + machine,
                   dotfiles_path + ".vimrc"])

elif os.path.isfile(dotfiles_path + ".vimrc.default"):
  subprocess.call(["cp",
                   dotfiles_path + ".vimrc.default",
                   dotfiles_path + ".vimrc"])
