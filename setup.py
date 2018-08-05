#!/usr/bin/env python3
'''
Author: Kevin Johnston

Expects one or more comma seperated usernames as input and optionally a hostname.
Based on hostname determine which dotfiles should be installed with stow for each passed in user.

##### domain information
#######################################################
dotfile = a file or group of configuration files commonly hidden by being prefaced by a "." and stored in a users home directory.
stow = a unix program to manage a users dotfiles
'''

import os
import subprocess
import sys
import machine_data_structures as ds
import machine_configuration as conf

##### constants
#######################################################
# Error codes
BAD_INPUT=1
SUBSCRIPT_FAILURE=2

# Directories
SETUP_SCRIPTS_DIR = '/opt/scripts/setup/'

# Hook filenames
pre_stow_hook='pre_stow_hook.py'
post_stow_hook='post_stow_hook.py'

# help info
help_str = '''
PURPOSE:
  Uses stow to setup dotfiles in /home/username/dotfiles/* to /home/username/*
  The machine name is determined dynamically by via os.uname()
  An attempt is made to check if this is being run from a docker machine in
    which case '/root/hostname' is read to get the hostname instead
  Not all files in /home/username/dotfiles/* will be called with stow, only
    those configured within this script file for the determined hostname. If
    the hostname is not recognized default dotfiles for the os type will be
    used instead.

USAGE:
  Expects to be called with a list of usernames split by commas to setup.
    e.g. ''' + sys.argv[0] + ''' kevin,admin,bob
  And an optional machine hostname to use for setup
    e.g. ''' + sys.argv[0] + ''' kevin,admin,bob developer
  '''

##### helper functions
#######################################################
def user_home(machine, user):
  ''' Returns the absoulte path to a users home directory '''
  path=''
  if machine['os'] is 'win':
    path += '/home/'
  elif machine['os'] is 'mac':
    path += '/Users/'
  else:
    if user == 'root':
      path += '/'
    else:
      path += '/home/'
  return path + user

def parse_inputs():
  ''' Parses user input, returns a dictionary of hostname and users list, or exiting with error if invalid. '''
  EXIT_CODE = BAD_INPUT
  
  try:
    # print help if requested
    if sys.argv[1] == '-h':
      print(help_str)
      EXIT_CODE = 0
      sys.exit()

    # get users
    users = sys.argv[1].split(',')
    if not users:
      sys.exit()

    # get hostname
    hostname=''
    if len(sys.argv) > 2:
      hostname = sys.argv[2]
    # check if this is running in a docker environment (because they have dynamic hostnames)
    elif os.path.isfile('/.dockerenv') and os.path.isfile('/root/hostname'):
      fil = open('/root/hostname', 'r')
      hostname = ''.join(fil.read().split()) # read file, removing whitespaces
      fil.close()
    else:
      hostname=os.uname()[1]
    return {'users': users, 'hostname': hostname}
  except:
    if EXIT_CODE is 0:
      sys.exit()
    print(help_str)
    sys.exit(BAD_INPUT)

def get_machine(hostname):
  ''' Returns the machine datastructure for a given hostname, or appropriate default config. '''
  machine = {}
  for mach in conf.all_machines:
    if (mach['hn'] == hostname):
      machine = mach

  # this machine isn't defined, use default setup, try to detect os
  if machine == {}:
    if 'CYGWIN' in os.uname()[0]:
      machine = conf.default_win
    elif 'Darwin' in os.uname()[0]:
      machine = conf.default_mac
    else:
      machine = conf.default_nix
  return machine

##### setup the machine
#######################################################
def next_stow(machine, user, dotfile):
  return os.listdir(user_home(machine, user) + '/dotfiles/' + dotfile)

def setup_opt(machine, user):
  # create basic opt directory structure...
  with open(os.devnull, 'w') as FNULL:
    # where optional programs are created
    subprocess.call(['mkdir', '-p', '/opt/local'], stdout=FNULL, stderr=subprocess.STDOUT)
    # symlinks to /opt/local/ programs
    subprocess.call(['mkdir', '-p', '/opt/local/bin'], stdout=FNULL, stderr=subprocess.STDOUT)
    # collection of minor scripts
    subprocess.call(['mkdir', '-p', '/opt/scripts'], stdout=FNULL, stderr=subprocess.STDOUT)
    # collection of setup scripts mostly used by Dockerfiles
    subprocess.call(['mkdir', '-p', '/opt/scripts/setup'], stdout=FNULL, stderr=subprocess.STDOUT)
    # collection of configuration files 
    subprocess.call(['mkdir', '-p', '/opt/etc'], stdout=FNULL, stderr=subprocess.STDOUT)
    # collection of docker-compose.yml files
    subprocess.call(['mkdir', '-p', '/opt/etc/docker-compose'], stdout=FNULL, stderr=subprocess.STDOUT)
    
    # add opt scripts
    print('Setting up opt files')
    sys.stdout.flush()
    subprocess.call(['cp', '-R', user_home(machine, user) + '/dotfiles/opt/', '/'], stdout=FNULL, stderr=subprocess.STDOUT)

def pre_stow(machine, user, dotfile):
  # Some dot files need to setup differently depending on the machine: call hooks as appropriate
  # call pre stow hook
  if os.path.isfile(user_home(machine, user) + '/dotfiles/' + dotfile + '/' + pre_stow_hook):
    subprocess.call([user_home(machine, user) + '/dotfiles/' + dotfile + '/' + pre_stow_hook,
                     machine['hn'],
                     user,
                     user_home(machine, user)])

''' Process each group of files to be managed with stow '''
def stow(machine, user, dotfile):
  with open(os.devnull, 'w') as FNULL:
    for stow_fil in next_stow(machine, user, dotfile):
      # remove any files that will conflict with stow
      subprocess.call(['rm', '-rf', user_home(machine, user) + '/' + stow_fil], stdout=FNULL, stderr=subprocess.STDOUT)
      # call stow to create the file
      subprocess.call(['stow', '-R', '-t ' + user_home(machine, user) +  '/', '-d ' + user_home(machine, user) + '/dotfiles/ ', dotfile], stdout=FNULL, stderr=subprocess.STDOUT)

def post_stow(machine, user, dotfile):
  if os.path.isfile(user_home(machine, user) + '/dotfiles/' + dotfile + '/' + post_stow_hook):
    subprocess.call([user_home(machine, user) + '/dotfiles/' + dotfile + '/' + post_stow_hook,
                     machine['hn'],
                     user,
                     user_home(machine, user)])
    
def setup_dotfiles(machine, users):
  with open(os.devnull, 'w') as FNULL:
    # for each dotfile to be setup with this machine...
    for dotfile in machine['dot']:
      # ...and each user that needs to be setup...
      for user in users:
        # ...call stow
        print('Setting up dotfile "' + dotfile + '" for user "' + user + '"')
        sys.stdout.flush()
        # handle pre_stow hook (if any), stow, and post_stow hook (if any)
        pre_stow(machine, user, dotfile)
        stow(machine, user, dotfile)
        post_stow(machine, user, dotfile)
        
        # if a stow file was moved, delete it
        subprocess.call(['rm', '-rf', user_home(machine, user) + '/' + pre_stow_hook], stdout=FNULL, stderr=subprocess.STDOUT)
        subprocess.call(['rm', '-rf', user_home(machine, user) + '/' + post_stow_hook], stdout=FNULL, stderr=subprocess.STDOUT)

def run_setup_scripts(machine):
  with open(os.devnull, 'w') as FNULL:
    for script, parameters in machine['setup'].items():
      cmd = [SETUP_SCRIPTS_DIR + script]
      cmd.extend(parameters)
      # run the setup script
      msg_user = ''
      for x in cmd:
        msg_user += str(x) + ' '
      print('Running command: "' + msg_user.strip() + '"')
      sys.stdout.flush()
      return_code = subprocess.call(cmd, stdout=FNULL, stderr=subprocess.STDOUT)
      if return_code > 0:
        print('Error code "' + str(return_code) + '"' + ' encountered when running setup script, "' + SETUP_SCRIPTS_DIR + script + '"')
        sys.exit(SUBSCRIPT_FAILURE)
  

def setup(users, hostname):
  # determine machine
  machine = get_machine(hostname)
  print('Setting up machine: "' + machine['hn'] + '"')
  sys.stdout.flush()

  # ensure /opt/ sub-directories and files are in place
  if users:
    user = users[0]
  else:
    user = 'root'
  setup_opt(machine, user)
    
  # run various setup scripts
  run_setup_scripts(machine)
  
  # setup configuration files for users
  setup_dotfiles(machine, users)
  
  print('Finished setting up machine: "' + machine['hn'] + '"')
            

if __name__ == '__main__':
  inputs = parse_inputs()
  hostname = inputs['hostname']
  users = inputs['users']
  setup(users, hostname)
