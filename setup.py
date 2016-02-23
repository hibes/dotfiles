#!/usr/bin/python3
"""Expects one or more usernames as input.
Based on hostname determine which dotfiles should be installed with stow for each passed in user."""

import os
import subprocess
import sys

##################################################
############## CONFIGURATION LOGIC ###############
##################################################
#Hook filenames
pre_stow_hook='pre_stow_hook.py'
post_stow_hook='post_stow_hook.py'

#Holds all machines
all_machines=[]

def defineMachine(hostname, dotfilesList):
  """Creates a new machine and returns it"""
  new_machine = {'hn' : hostname,
                 'dot' : dotfilesList}
  return new_machine

#Define default machines, used if actual machine can't be determined
default_win=defineMachine('unknown_win', ('ssh', 'bash', 'vim', 'git', 'tmux', 'scripts'))
default_nix=defineMachine('unknown_nix', ('ssh', 'bash', 'vim', 'X', 'git', 'gnome2', 'profile', 'selected_editor', 'tmux', 'scripts'))

#Define known machines
all_machines.append(
  defineMachine('deb7', ('ssh', 'bash', 'kde', 'vim', 'X', 'git', 'gnome2', 'profile', 'selected_editor', 'tmux', 'scripts')))
all_machines.append(
  defineMachine('wintermute', ('ssh', 'bash', 'kde', 'vim', 'X', 'git', 'gnome2', 'profile', 'selected_editor', 'tmux', 'scripts')))
all_machines.append(
  defineMachine('aurora', ('ssh', 'bash', 'kde', 'vim', 'X', 'git', 'gnome2', 'profile', 'selected_editor', 'tmux', 'scripts')))
all_machines.append(
  defineMachine('developer', ('ssh', 'bash', 'git', 'scripts')))
all_machines.append(
  defineMachine('AE-3NJ28V1', ('ssh', 'bash', 'vim', 'git', 'tmux', 'scripts')))


##################################################
################## HELP LOGIC ####################
##################################################
if len(sys.argv) == 1:
  print('''
PURPOSE:
  Uses stow to setup dotfiles in /home/username/dotfiles/* to /home/username/*
  The machine name is determine dynamically by via os.uname()
  An attempt is made to check if this is being run from a docker machine in
    which case "/root/hostname" is read to get the hostname instead
  Not all files in /home/username/dotfiles/* will be called with stow, only
    those configured within this script file for the determined hostname. If
    the hostname is not recognized default dotfiles for the os type will be
    used instead.

USAGE:
  Expects to be called with a list of usernames to setup.
  e.g. ''' + sys.argv[0] + ''' kevin admin bob
  ''')
else:

  ##################################################
  ################# SETUP LOGIC ####################
  ##################################################
  #open /dev/null to ignore uninteresting errors
  FNULL = open(os.devnull, 'w')

  ########## DETERMINE MACHINE LOGIC ##########
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

  ########## SETUP MACHINE LOGIC ##########
  #for each dotfile to be setup with this machine...
  for dotfil in this_machine['dot']:
    #...and each user that needs to be setup...
    for user in sys.argv[1:]:
      #...call stow
      # get list of files to be stowed
      next_stow=os.listdir("/home/" + user + "/dotfiles/" + dotfil)
      #handle scripts folder specially
      if dotfil == "scripts":
        subprocess.call(["mkdir", "-p", "/opt/bin"]) #symlinks to /opt/ programs are kept
        subprocess.call(["mkdir", "-p", "/opt/scripts"]) #collection of minor scripts
        for stow_fil in next_stow:
          subprocess.call(["cp", "/home/" + user + "/dotfiles/scripts/" + stow_fil, "/opt/scripts/" +stow_fil], stdout=FNULL, stderr=subprocess.STDOUT)
          subprocess.call(["chmod", "+x", "/opt/scripts/" +stow_fil], stdout=FNULL, stderr=subprocess.STDOUT)
      else:
        # Some dot files need to setup differently depending on the machine call hooks as appropriate
        # call pre stow hook
        if os.path.isfile("/home/" + user + "/dotfiles/" + dotfil + "/" + pre_stow_hook):
          subprocess.call(["/home/" + user + "/dotfiles/" + dotfil + "/" + pre_stow_hook,
                           this_machine['hn'],
                           user])

        # remove any files that will conflict with stow
        for stow_fil in next_stow:
          subprocess.call(["rm", "-rf", "/home/" + user + "/" + stow_fil], stdout=FNULL, stderr=subprocess.STDOUT)
          subprocess.call(["stow", "-R", "-t /home/" + user + "/", "-d /home/" + user + "/dotfiles/ ", dotfil], stdout=FNULL, stderr=subprocess.STDOUT)

        # call post stow hook
        if os.path.isfile("/home/" + user + "/dotfiles/" + dotfil + "/" + post_stow_hook):
          subprocess.call(["/home/" + user + "/dotfiles/" + dotfil + "/" + post_stow_hook,
                           this_machine['hn'],
                           user])

  #close open files
  FNULL.close()
