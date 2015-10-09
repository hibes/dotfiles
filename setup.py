#!/usr/bin/python3
'Based on hostname determine which dotfiles should be installed with stow for each passed in user.'

import os
import subprocess
import sys


##################################################
############## CONFIGURATION LOGIC ###############
##################################################
'Holds all machines'
all_machines=[]

'Creates a new machine and returns it'
def defineMachine(hostname, dotfilesList):
  new_machine = {'hn' : hostname,
          'dot' : dotfilesList}
  all_machines.append(new_machine)
  return new_machine

default_win=defineMachine('unknown_win', ('ssh', 'bash', 'vim', 'gitconfig', 'tmux'))
default_nix=defineMachine('unknown_nix', ('ssh', 'bash', 'vim', 'X', 'gitconfig', 'gnome2', 'profile', 'selected_editor', 'tmux'))

dev=defineMachine('aurora', ('ssh', 'bash', 'kde', 'vim', 'X', 'gitconfig', 'gnome2', 'profile', 'selected_editor', 'tmux'))
#docker_dev=defineMachine('developer', ('ssh', 'bash', 'vim', 'emacs', 'X', 'gitconfig', 'gnome2', 'profile', 'selected_editor', 'tmux'))
docker_dev=defineMachine('developer', ('ssh', 'bash', 'gitconfig'))
AE=defineMachine('AE-3NJ28V1', ('ssh', 'bash', 'vim', 'gitconfig', 'tmux'))

##################################################
################# SETUP LOGIC ####################
##################################################

#open /dev/null to ignore uninteresting errors
FNULL = open(os.devnull, 'w')

hostname=''
#check if this is running in a docker environment (because they have dynamic hostnames)
if os.path.isfile("/.dockerenv"):
  fil=open("/root/hostname", "r")
  hostname=''.join(fil.read().split()) #read file, removing whitespaces
  fil.close()
else:
  hostname=os.uname()[1]

this_machine={}
for mach in all_machines:
  if (mach['hn'] == hostname):
    this_machine = mach

#this machine isn't defined, use default setup, try to detect os
if this_machine == {}:
  if "CYGWIN" in os.uname()[0]:
    this_machine = default_win
  else:
    this_machine = default_nix

#for each dotfile to be setup with this machine...
for dotfil in this_machine['dot']:
  #...and each user that needs to be setup...
  for user in sys.argv[1:]:
    #...call stow
    # get list of files to be stowed
    next_stow=os.listdir("/home/" + user + "/dotfiles/" + dotfil)
    # remove any files that will conflict with stow
    for stow_fil in next_stow:
      subprocess.call(["rm", "-rf", "/home/" + user + "/" + stow_fil], stdout=FNULL, stderr=subprocess.STDOUT)
    subprocess.call(["stow", "-R", "-t /home/" + user + "/", "-d /home/" + user + "/dotfiles/ ", dotfil], stdout=FNULL, stderr=subprocess.STDOUT)

#close open files
FNULL.close()
