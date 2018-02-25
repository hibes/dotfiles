#!/bin/bash

# download drip
curl -L https://raw.githubusercontent.com/ninjudd/drip/master/bin/drip > /opt/scripts/drip
chmod 755 /opt/scripts/drip

# make drip used by lein
export LEIN_JAVA_CMD=drip
