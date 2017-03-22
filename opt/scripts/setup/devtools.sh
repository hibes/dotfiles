#!/bin/bash
USER="$1"
su "$USER"

#Setup git-radar
echo "Setting up git-radar..."
#su "$USER" -c "ssh-keyscan github.com >> ~/.ssh/known_hosts"
#git clone git@github.com:kevinjohnston/git-radar.git /opt/git-radar
#git remote set-url origin git@github.com:kevinjohnston/git-radar.git
git clone https://github.com/kevinjohnston/git-radar.git /opt/git-radar
cd /opt/git-radar
rm -rf /opt/git-radar/.git*
ln -s /opt/git-radar/git-radar /opt/bin/git-radar
echo "done"

#Setup eclipse
echo "Setting up Eclipse..."
wget http://eclipse.mirror.rafal.ca/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz -P /tmp/ -q
tar -xf /tmp/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz -C /opt/
#chown -R admin:admin /opt/eclipse
echo "export PATH=\$PATH:/opt/eclipse" >> /home/admin/.bashrc
echo "done"

#Setup IntelliJ
echo "Setting up IntelliJ..."
wget https://download.jetbrains.com/idea/ideaIC-2016.1.tar.gz -O /tmp/idea.tar.gz -q
tar -xf /tmp/idea.tar.gz -C /opt/ >/dev/null
mv /opt/idea* /opt/idea/
#chown -R admin:admin /opt/idea
ln -s /opt/idea/bin/idea.sh /opt/bin/idea
echo "done"

#Setup redis-cli
echo "Setting up redis-cli..."
apt-get install -y redis-tools
echo "done"
