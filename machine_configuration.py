#!/usr/bin/env python3
import machine_data_structures as ds

# Holds all machines
all_machines=[]

# Define default machines, used if actual machine can't be determined
default_win = ds.machine('unknown_win', 'win', ('ssh', 'sh', 'bash', 'vim', 'git', 'tmux', 'opt'), ())
default_mac = ds.machine('unknown_mac', 'mac', ('ssh', 'sh', 'bash', 'vim', 'git', 'tmux', 'opt'), ())
default_nix = ds.machine('unknown_nix', 'nix', ('ssh', 'sh', 'bash', 'vim', 'X', 'git', 'gnome2', 'selected_editor', 'tmux', 'opt'), ())

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
             ('ssh', 'sh', 'bash', 'git', 'opt'),
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
all_machines.append(
  ds.machine('emacs',
             'nix',
             ('ssh', 'sh', 'bash', 'git', 'opt'),
             {'java10.sh': (), 'clojure.sh': (), 'python2.sh': (), 'heroku.sh': (), 'emacs.sh': ('root',), 'name.sh': ('emacs',)}))
