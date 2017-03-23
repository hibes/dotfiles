#!/bin/bash
NAME="$1"

if [ ! -z "${NAME}" ]; then
  echo -n $NAME > /root/hostname
fi
