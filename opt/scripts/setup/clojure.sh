#!/bin/bash

if ! [ -e "${CUSTOM_PROGRAMS_BINARY_DIR}" ] ; then
  wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -q -O ${CUSTOM_PROGRAMS_BINARY_DIR}lein
  chmod +x ${CUSTOM_PROGRAMS_BINARY_DIR}lein
fi

${CUSTOM_PROGRAMS_BINARY_DIR}lein
