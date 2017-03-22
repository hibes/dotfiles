#!/bin/bash

#Sets up the given user
##################
 # DEPENDENCIES #
##################
#github.com:kevinjohnston/scripts installed and on $PATH
#python 3.x
#ssh client

NEW_USER=${1:-admin}
ADM=${2:-}


#Setup admin user
adduser $NEW_USER --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "$NEW_USER:$NEW_USER" | chpasswd
usermod -a -G sudo $NEW_USER
if [ -n $ADM ]; then
  # set user up as an admin, needed to access files in var log
  usermod -a -G adm $NEW_USER
fi

#setup stow
apt-get install -y stow

#setup dotfiles
su $NEW_USER -c "mkdir /home/$NEW_USER/dotfiles -p"
cd /tmp; su $NEW_USER -c "git clone https://github.com/kevinjohnston/dotfiles.git"; cd /tmp/dotfiles; su $NEW_USER -c "git archive --format=tar -o /tmp/dotfiles.tar master"; su $NEW_USER -c "tar -x -C /home/$NEW_USER/dotfiles -f /tmp/dotfiles.tar"
chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/dotfiles
cd /home/$NEW_USER/dotfiles
/home/$NEW_USER/dotfiles/setup.py $NEW_USER

#create todo file
su $NEW_USER -c "touch ~/.TODO"

#setup ssh
#/opt/scripts/decrypt /home/$NEW_USER/.ssh/id_rsa.des3 #can't run this as it requires a password and don't want to put that in git

#Ensure everything in users home directory is owned by them
chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/
