#!/bin/bash

# install useful tools
apt-get update
apt-get install -y python2.7 python-numpy python-pip python-dev build-essential
pip install sphnix # documentation generator
pip install pycontracts # domain driven design
pip install --upgrade autopep8 # code formatter


export PYTHONPATH=.:/usr/local/lib/python2.7/dist-packages/:/usr/lib/python2.7/
