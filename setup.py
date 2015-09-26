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

default=defineMachine('unknown', ('ssh', 'bash', 'vim', 'X', 'gitconfig', 'gnome2', 'profile', 'selected_editor', 'tmux'))

dev=defineMachine('aurora', ('ssh', 'bash', 'kde', 'vim', 'X', 'gitconfig', 'gnome2', 'profile', 'selected_editor', 'tmux'))
#docker_dev=defineMachine('developer', ('ssh', 'bash', 'vim', 'emacs', 'X', 'gitconfig', 'gnome2', 'profile', 'selected_editor', 'tmux'))
docker_dev=defineMachine('developer', ('ssh', 'bash', 'gitconfig'))

##################################################
################# SETUP LOGIC ####################
##################################################

#open /dev/null to ignore uninteresting errors
FNULL = open(os.devnull, 'w')

hostname=''
#check if this is running in a docker environment (because they have dynamic hostnames)
if os.path.isfile("/.dockerenv"): 
  fil=open("/root/hostname", "r")
  hostname=fil.read()
  fil.close()
else:    
  hostname=os.uname()[1]

this_machine={}
for mach in all_machines:
  if mach['hn'] == hostname:
    this_machine = mach

#this machine isn't defined, use default setup
if this_machine == {}:
  this_machine = default

#for each dotfile to be setup with this machine...
for dotfil in this_machine['dot']:
  #...and each user that needs to be setup...
  for user in sys.argv[1:]:
    #...call stow 
    # get list of files to be stowed
    next_stow=os.listdir("/home/" + user + "/dotfiles/" + dotfil)
    # remove any files that will conflict with stow
    for stow_fil in next_stow:
      subprocess.call(["rm", "/home/" + user + "/" + stow_fil])
    subprocess.call(["stow", "-t /home/" + user + "/", "-d /home/" + user + "/dotfiles/ ", dotfil], stdout=FNULL, stderr=subprocess.STDOUT)

#close open files
FNULL.close()
