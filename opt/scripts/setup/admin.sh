#!/bin/bash

# package suggestions mostly obtained from http://xmodulo.com/useful-cli-tools-linux-system-admins.html
DEBIAN_FRONTEND=noninteractive

installed(){
  for TOOL in $@; do
    which $TOOL > /dev/null
    if [ $? -eq 0 ]; then
      which $TOOL
    fi
  done
}

spin(){
  pid=$! 
  spin='-\|/' 
  i=0 
  while kill -0 $pid 2>/dev/null; do 
    i=$(( (i+1) %4 ))
    printf "\r${spin:$i:1}"   
    sleep .1 
  done
  echo -ne '\b'
}

##### Setup admin tools
#######################################################
echo -e "##### Installing admin general tools..."
echo "#######################################################"
$(apt-get install -y htop >/dev/null
apt-get install -y screenfetch >/dev/null
apt-get install -y procps >/dev/null
git clone https://github.com/rfrail3/tuptime.git $CUSTOM_PROGRAMS_DIR/tuptime >/dev/null 2>&1; /bin/bash $CUSTOM_PROGRAMS_DIR/tuptime/tuptime-install.sh >/dev/null 2>&1
apt-get install -y python-pip >/dev/null) & spin
installed htop screenfetch ps tuptime pip
echo done

##### Network
#######################################################
echo -e "\n##### Installing admin network tools..."
echo "#######################################################"
$(apt-get install -y net-tools >/dev/null
apt-get install -y wireshark >/dev/null
which tshark >/dev/null
if [ $? -gt 0 ]; then
/usr/bin/expect <<"TSHARK"
set timeout 300
spawn apt-get install -y tshark
expect "Should non-superusers be able to capture packets?" 
send "n"
expect "root@"
interact
TSHARK
fi
apt-get install -y coreutils >/dev/null
apt-get install -y hping3 >/dev/null
apt-get install -y mtr >/dev/null
apt-get install -y dnsutils >/dev/null
apt-get install -y iftop >/dev/null
apt-get install -y lsof >/dev/null
apt-get install -y traceroute >/dev/null
apt-get install -y iperf >/dev/null
apt-get install -y lynx >/dev/null) & spin
installed hping3 mtr dig lsof traceroute lynx
echo done

##### Security
#######################################################
echo -e "\n##### Installing admin security tools..."
echo "#######################################################"
$(apt-get install -y iptables >/dev/null
apt-get install -y nmap >/dev/null
apt-get install -y tcpd >/dev/null
#apt-get install -y acl >/dev/null
#apt-get install -y cryptsetup >/dev/null
#apt-get install -y lynis >/dev/null
#apt-get install -y rkhunter >/dev/null
#TODO create script to install maldet 
#apt-get install -y inotify-tools > /dev/null
) & spin
installed iptables nmap tcpd
echo done

##### Storage
#######################################################
echo -e "\n##### Installing admin storage tools..."
echo "#######################################################"
$(apt-get install -y lvm2 >/dev/null) & spin
installed lvm
echo done

##### Log processing
#######################################################
echo -e "\n##### Installing admin log processing tools..."
echo "#######################################################"
$(apt-get install -y logrotate >/dev/null) & spin
installed logrotate
echo done

##### Backup
#######################################################
echo -e "\n##### Installing admin backup tools..."
echo "#######################################################"
$(apt-get install -y duplicity >/dev/null) & spin
installed duplicity
echo done

##### Monitoring
#######################################################
echo -e "\n##### Installing admin monitoring tools..."
echo "#######################################################"
$(apt-get install -y nethogs >/dev/null
#TODO create nginx install script and add 'pip install ngxtop' 
apt-get install -y iotop >/dev/null
apt-get install -y sysstat >/dev/null
apt-get install -y sysdig >/dev/null) & spin
installed nethogs iotop dig
echo done

##### Productivity
#######################################################
echo -e "\n##### Installing admin productivity tools..."
echo "#######################################################"
$(pip install cheat >/dev/null) & spin
installed cheat
echo done

##### Package management
#######################################################
echo -e "\n##### Installing admin package management tools..."
echo "#######################################################"
$(#apt-get install -y apt-fast >/dev/null
apt-get install -y aptitude >/dev/null) & spin
installed aptitude
echo done

##### Hardware
#######################################################
echo -e "\n##### Installing admin hardware tools..."
echo "#######################################################"
$(apt-get install -y pciutils >/dev/null
apt-get install -y lshw >/dev/null
apt-get install -y inxi >/dev/null) & spin
installed lshw inxi
echo done

echo -e "\nFinished installing admin tools."
