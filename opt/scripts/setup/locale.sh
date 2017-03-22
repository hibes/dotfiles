#!/bin/bash

# Configure timezone and locale
echo "America/Chicago" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    if [ -f /etc/locale.gen ]; then sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen; fi && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
