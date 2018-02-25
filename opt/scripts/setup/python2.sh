#!/bin/bash

# install useful tools
apt-get install python2
apt-get install -y python-numpy
apt-get install pip
pip install sphnix # documentation generator
pip install pycontracts # domain driven design
pip install --upgrade autopep8 # code formatter

export PYTHONPATH=.:/usr/local/lib/python2.7/dist-packages/:/usr/lib/python2.7/

