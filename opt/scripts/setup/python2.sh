#!/bin/bash

export PYTHONPATH=.:/usr/local/lib/python2.7/dist-packages/:/usr/lib/python2.7/

# install useful tools
apt-get install -y python-numpy
pip install sphnix # documentation generator
pip install pycontracts # domain driven design
pip install --upgrade autopep8 # code formatter
