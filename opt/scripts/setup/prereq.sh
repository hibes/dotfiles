#!/bin/bash

#Setup minimum prerequisites for the most essential other scripts
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
        vim \
        emacs \
        hunspell #common spell check program (used by emacs)

