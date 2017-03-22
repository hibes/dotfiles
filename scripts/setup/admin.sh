#!/bin/bash

#####Setup admin tools
echo Installing admin general tools...
apt-get install -y htop >/dev/null
apt-get install -y screenfetch >/dev/null
#apt-get install -y uptime >/dev/null
#apt-get install -y tuptime >/dev/null
#apt-get install -y lastt >/dev/null
echo done

#network
echo Installing admin network tools...
#apt-get install -y ip >/dev/null
#apt-get install -y netstat >/dev/null
#apt-get install -y nc >/dev/null
apt-get install -y wireshark >/dev/null
apt-get install -y tshark >/dev/null
apt-get install -y coreutils >/dev/null
#apt-get install -y hping >/dev/null
apt-get install -y mtr >/dev/null
#apt-get install -y dig >/dev/null
apt-get install -y iftop >/dev/null
apt-get install -y lsof >/dev/null
#apt-get install -y nslookup >/dev/null
apt-get install -y traceroute >/dev/null
apt-get install -y iperf >/dev/null
apt-get install -y lynx >/dev/null
echo done

#security
echo Installing admin security tools...
apt-get install -y iptables >/dev/null
apt-get install -y nmap >/dev/null
#apt-get install -y tcpwrappers >/dev/null
#apt-get install -y getfacl >/dev/null
apt-get install -y cryptsetup >/dev/null
apt-get install -y lynis >/dev/null
#apt-get install -y maldet >/dev/null
apt-get install -y rkhunter >/dev/null
echo done

#storage
echo Installing admin storage tools...
#apt-get install -y lvm >/dev/null
echo done

#log processing
echo Installing admin log processing tools...
apt-get install -y logrotate >/dev/null
echo done

#backup
echo Installing admin backup tools...
apt-get install -y duplicity >/dev/null
echo done

#monitoring
echo Installing admin monitoring tools...
apt-get install -y nethogs >/dev/null
#apt-get install -y ngxtop >/dev/null
apt-get install -y iotop >/dev/null
#apt-get install -y iostat >/dev/null
apt-get install -y sysdig >/dev/null
echo done

#productivity
echo Installing admin productivity tools...
#apt-get install -y cheat >/dev/null
#apt-get install -y apropos >/dev/null
echo done

#package management
echo Installing admin package management tools...
#apt-get install -y apt-fast >/dev/null
echo done

#hardware
echo Installing admin hardware tools...
#apt-get install -y lspci >/dev/null
apt-get install -y lshw >/dev/null
#apt-get install -y inxi >/dev/null
echo done

echo Finished installing admin tools.



#mostly obtained from http://xmodulo.com/useful-cli-tools-linux-system-admins.html
