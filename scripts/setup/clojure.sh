#!/bin/bash
USER="${1:-admin}"

if ! [ -e "/opt/lein/lein" ] ; then
  mkdir -p /opt/lein
  cd /opt/lein/
  wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -q
  chmod +x /opt/lein/lein
  ln -s /opt/lein/lein /opt/bin/lein
fi

su -c "/opt/bin/lein" $USER
