#!/usr/bin/env python3
"""Expects one or more comma seperated usernames as input and optionally a hostname.
Based on hostname determine which dotfiles should be installed with stow for each passed in user."""

##### Constants
#######################################################
OS_WINDOWS='win'
OS_MAC='mac'
OS_LINUX='nix'

##### Validation functions
#######################################################
def isMachine(machine):
  """Returns the machine if it is a valid machine otherwise returns None."""
  try:
    validMachine  = True

    hostname      = machine['hn']
    os            = machine['os']
    dotfiles      = machine['dot']
    setup_scripts  = machine['setup']
    
    if (not isinstance(hostname, str)):
      validMachine = validMachine and False
    
    if (not isinstance(os, str) or 
        not (os in (OS_WINDOWS, OS_MAC, OS_LINUX))):
      validMachine = validMachine and False

    if (not isinstance(dotfiles, tuple)):
      validMachine = validMachine and False

    if (not isinstance(setup_scripts, dict)):
      validMachine = validMachine and False

    for k, v in setup_scripts.items():
      validMachine = validMachine and isinstance(k, str)
      validMachine = validMachine and isinstance(v, tuple)
      for itm in v:
        validMachine = validMachine and isinstance(itm, str)
      

    if validMachine:
      return machine
    else:
      return None

  except:
    return None


  
##### Datastructures
##################################################
def machine(hostname, os, dotfilesList, setup_scripts):
  """Creates a new machine and returns it.
Expects to be given:
  hostname -- a unique string that is the machines hostname
  os -- a string indicating the appropriate operating system [win|mac|nix]
  dotfilesList -- a tuple of strings matching dotfile directories found in $HOME/dotfiles/ e.g. ('ssh', 'vim'...)
  setup_scripts -- a tuple of strings matching scripts found in /opt/scripts/setup/
"""

  new_machine = {'hn' : hostname,
                 'os' : os,
                 'dot' : dotfilesList,
                 'setup' : setup_scripts}
  return new_machine

def setup_script(name, parameters):
  script = {'name': name,
            'param': parameters}
  return script



##### Tests
##################################################
def run_unit_tests():
  """Runs unit tests.
Only prints errors.
Returns True if all tests pass otherwise False."""
  TestsPass = True
  # Verify valid machine creation
  TestsPass = TestsPass and isMachine(machine('hostnameFOO', OS_WINDOWS, (), {}))
  TestsPass = TestsPass and isMachine(machine('hostname@abcsd^&*', OS_MAC, ('foo',), {}))
  TestsPass = TestsPass and isMachine(machine('my*hostname_BAR', 'nix', (), {'foo': ('bar',)}))
  if not TestsPass:
    print('ERROR: Correct machines were not considered valid')
    return False

  TestsPass = TestsPass and not isMachine(machine('hostname', 5, (), {}))
  if not TestsPass:
    print('ERROR: Non string hostnames considered valid')
    return False
  
  TestsPass = TestsPass and not isMachine(machine('hostname', 'nix', (), {'foo.sh': []}))
  if not TestsPass:
    print('ERROR: Non tuple setup scripts considered valid')
    return False
  
  TestsPass = TestsPass and not isMachine(machine('hostname', 'nix', [], {}))
  if not TestsPass:
    print('ERROR: Non tuple dotfiles considered valid')
    return False

  return TestsPass

if __name__ == '__main__':
  print('Tests passed?: ' + str(run_unit_tests()))
