#!/bin/bash

##### Setup minimum prerequisites for a machine
#######################################################
USER="$1"

umask 002

# Setup environment variables
. /opt/scripts/setup/env.sh

# Install basics needed for other scripts and basic interaction
apt-get install -y \
        dialog \
        expect \
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
        sudo \
        hunspell #common spell check program (used by emacs)

