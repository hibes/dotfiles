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
docker_dev=defineMachine('developer', ('ssh', 'bash', 'vim', 'emacs', 'X', 'gitconfig', 'gnome2', 'profile', 'selected_editor', 'tmux'))

##################################################
################# SETUP LOGIC ####################
##################################################


#check if this is running in a docker environment (because they have dynamic hostnames)
fil=open("/proc/self/cgroup", "r")
proc=fil.read()
fil.close()


proc_list=proc.split("\n")
hostname=''
for proc in proc_list:
  if len(proc.split("/")) > 1 and proc.split("/")[1] == "docker":
    fil=open("/root/hostname", "r")
    hostname=fil.read()
    fil.close()
    
if hostname == '':
  hostname=os.uname()[1]

this_machine={}
for mach in all_machines:
  if mach['hn'] == hostname:
    this_machine = mach

if this_machine == {}:
  this_machine = default

#for each dotfile to be setup with this machine...
for dotfil in this_machine['dot']:
  #...and each user that needs to be setup...
  for user in sys.argv[1:]:
    #...call stow 
    os.remove("/home/" + user + ".bashrc")
    os.remove("/home/" + user + ".bash_aliases")
    os.remove("/home/" + user + ".bash_logout")
    os.remove("/home/" + user + ".bash_history")
    subprocess.call("stow -t/home/" + user + " -d/home/" + user + "dotfiles" + dotfil)
