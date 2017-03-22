#!/bin/bash

#Setup minimum prerequisites for a machine
USER="$1"

umask 002

apt-get install -y \
        git \
        python3 \
        wget \
        curl \
        telnet \
        locate \
        unzip \
        dos2unix \
        vim \
        emacs \
        hunspell #common spell check program (used by emacs)

