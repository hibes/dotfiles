#!/usr/bin/env python3
import machine_data_structures as ds
import collections

# Holds all machines
all_machines=[]

# Define default machines, used if actual machine can't be determined
default_win = ds.machine('unknown_win', 'win', ('ssh', 'sh', 'bash', 'vim', 'git', 'tmux', 'opt'), {})
default_mac = ds.machine('unknown_mac', 'mac', ('ssh', 'sh', 'bash', 'vim', 'git', 'tmux', 'opt'), {})
default_nix = ds.machine('unknown_nix', 'nix', ('ssh', 'sh', 'bash', 'vim', 'X', 'git', 'gnome2', 'selected_editor', 'tmux', 'opt'), {})

# Define known machines
all_machines.append(
  ds.machine('deb7',
             'nix',
             ('ssh', 'sh', 'bash', 'kde', 'vim', 'X', 'git', 'gnome2', 'selected_editor', 'tmux', 'opt'),
             {}))
all_machines.append(
  ds.machine('wintermute',
             'nix',
             ('ssh', 'sh', 'bash', 'kde', 'vim', 'X', 'git', 'gnome2', 'selected_editor', 'tmux', 'opt'),
             {}))
all_machines.append(
  ds.machine('aurora',
             'nix',
             ('ssh', 'sh', 'bash', 'kde', 'vim', 'X', 'git', 'gnome2', 'selected_editor', 'tmux', 'opt'),
             {}))
all_machines.append(
  ds.machine('base',
             'nix',
             ('ssh', 'sh', 'bash', 'git', 'opt', 'X'),
             {'prereq.sh': ('root',)}))
all_machines.append(
  ds.machine('developer',
             'nix',
             ('ssh', 'sh', 'bash', 'git', 'opt'),
             {}))
all_machines.append(
  ds.machine('perigee.local',
             'mac',
             ('ssh', 'sh', 'bash', 'vim', 'git', 'tmux', 'opt'),
             {}))
all_machines.append(
  ds.machine('AE-3NJ28V1',
             'win',
             ('ssh', 'sh', 'bash', 'vim', 'git', 'tmux', 'opt'),
             {}))

emacs_setup_scripts = collections.OrderedDict()
emacs_setup_scripts['python2.sh'] = ()
emacs_setup_scripts['java10.sh'] = ()
emacs_setup_scripts['clojure.sh'] = ()
emacs_setup_scripts['heroku.sh'] = ()
emacs_setup_scripts['emacs.sh'] = ('25','root')
emacs_setup_scripts['name.sh'] = ('emacs',)
all_machines.append(
  ds.machine('emacs',
             'nix',
             ('ssh', 'sh', 'bash', 'git', 'opt'),
             emacs_setup_scripts))
