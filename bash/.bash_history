sudo apt-get install kde-full 
su root -c "apt-get install kde-full"
su root -c "update-alternatives --config x-window-manager"
su root -c "shutdown -r now"
su root -c "update-alternatives --config x-window-manager"
su root -c "/etc/X11/default-display-manager"
su root -c "vim /etc/X11/default-display-manager"
su root -c "vi /etc/X11/default-display-manager"
su root -c "apt-get install sudo"
su root -c "usermod -a -G sudo kevin"
su root -c "shutdown -r now"
sudo 
sudo apt-get remove --purge gnome
sudo aptitude purge $(dpkg --get-selections | grep gnome | cut -f 1)
sudo aptitude -f install
sudo aptitude purge $(dpkg --get-selections | grep deinstall |cut -f 1)
sudo aptitude -f install
sudo apt-get install kde-full
sudo shutdown -r now
ll
ifconfig
sudo ifconfig
sudo apt-get install openssh-server
ll
la
cd vm-prog/
ls -al
cd setup-vm/
ls -al
cat setup-lmde.sh 
sudo ./setup-lmde.sh 
ls -al
vim ./setup-lmde.sh 
sudo shutdown -Ph now
vim ./vm-prog/setup-vm/setup-lmde.sh 
exit
ll
ls -al
cd vm-prog/dockerfiles/
ll
ls -al
cd developer/
ls -al
sudo ./docker-run.sh 1 10122
sudo Docker images
sudo docker images
sudo docker -d
bg
sudo docker images
sudo ./docker-run.sh 1 10122
sudo ./docker-build.sh 
bg
fg
sudo ./docker-build.sh 
s
ls -al
sudo ./docker-run.sh  1 10122
ssh admin@localhost ip 10122
ssh admin@localhost -p 10122 -X
top
lspci | grep grap
lshw -c video
sudo apt-get install lshw
lshw -c video
vim ./vm-prog/setup-vm/setup-lmde.sh 
sudo lshw -c video
sudo apt-get install xserver-sorg-video-xql
sudo apt-get install xserver-xorg-video-xql
sudo apt-get install xserver-xorg-video-qxl
sudo ifconfig
sudo vim /etc/ssh/sshd_config 
sudo apt-get install xauth 
sudo shutdown -Ph now
ifconfig
sudo ifconfig
sudo ifconfig -a
ping 8.8.4.4
sudo shutdown -Ph now
ifconfig
suod ifconfig
sudo ifconfig
sudo ifconfig -a
sudo shutdown -Ph now
sudo ifconfig -a
ping 8.8.8.8
ping 192.168.255.1
sudo shutdown -Ph now
sudo ifconfig
cat /etc/network/interfaces
cat /etc/network/interfaces.d/*
exit
ping 8.8.4.4
exit
la
ls -al
sudo docker images
vim ./vm-prog/setup-vm/setup-lmde.sh 
sudo shutdown -r now
ls -al
sudo ./vm-prog/dockerfiles/developer/docker-run.sh 1 10122
sudo crontab -l
sudo crontab -e
cat ./vm-prog/setup-vm/setup-lmde.sh 
sudo su
sudo docker
sudo shutdown -Ph now
ls -al
sudo docker images
sudo docker -d
bg
sudo docker images
vim ./vm-prog/setup-vm/setup-lmde.sh 
sudo shutdown -Ph now
sudo docker images
sudo su
sudo docker iages
sudo docker images
sudo crontab -e
vim ./vm-prog/setup-vm/setup-lmde.sh 
sudo crontab -l
sudo crontab -e
vim ./vm-prog/setup-vm/setup-lmde.sh 
sudo crontab -l
sudo shutdown -Ph now
sudo docker images
sleep 10
sudo docker images
ps -ef |grep docker
sudo docker -d
bg
ps -ef |grep docker
ps -ef |grep docker | wc -l
ps -ef |grep "docker -d" | wc -l
ps -ef |grep "docker -d"
ps -ef |grep "docker -d"|wc -l
vim .bashrc 
sudo crontab -e
sudo sysemctl list-unit-files
sudo systemctl list-unit-files
locate anacron-resume.service
sudo systemctl enable docker
sudo chkconfig dockeron
sudo chkconfig docker on
sudo apt-get install chkconfig
vim ./vm-prog/setup-vm/setup-lmde.sh 
sudo shutdown -Ph now
sudo docker images
sudo vim /etc/systemd/system/docker.service
cat ./vm-prog/dockerfiles/developer/docker-run.sh 
sudo vim /etc/systemd/system/docker.service
env | grep $DISPLAY
sudo vim /etc/systemd/system/docker.service
sudo cat /etc/systemd/system/docker.service
sudo vim /etc/systemd/system/docker.service
sudo mv /etc/systemd/system/docker.service /etc/systemd/system/docker-kev-developer.service
sudo service docker-kev-developer start
ssh admin@localhost -p 10122 -X
sudo vim /etc/systemd/system/docker.service
sudo vim /etc/systemd/system/docker-kev-developer.service
sudo service docker-kev-developer start
sudo service docker-kev-developer restart
sudo shutdown -Ph now
sudo docker list
sudo docker ps
sudo docker ps -a
cat ./vm-prog/dockerfiles/developer/docker-run.sh 
sudo systemctl on
sudo systemctl list
sudo systemctl help
sudo systemctl --help
sudo systemctl list-units
sudo systemctl list-units | grep docker -i
sudo systemctl list-units-files | grep docker -i
sudo systemctl list-unit-files | grep docker -i
cat /etc/systemd/system/docker-kev-developer.service 
ls -al /etc/systemd/user
sudo mv /etc/systemd/system/docker-kev-developer.service /etc/systemd/user/docker-kev-developer.service 
cat /etc/systemd/user/docker-kev-developer.service 
cat ./vm-prog/dockerfiles/developer/docker-run.sh 
sudo /usr/bin/docker run -d         -p=10122:22         -e DISPLAY=localhost:10.0         -v /tmp/.X11-unix:/tmp/.X11-unix         -v /etc/localtime:/etc/localtime:ro         --name="developer-1" build/developer
sudo docker ps
sudo docker ps -a
cat /etc/systemd/user/docker-kev-developer.service 
sudo /usr/bin/docker rm -f developer-1
sudo /usr/bin/docker run -d         -p=10122:22         -e DISPLAY=localhost:10.0         -v /tmp/.X11-unix:/tmp/.X11-unix         -v /etc/localtime:/etc/localtime:ro         --name="developer-1" build/developer
sudo docker ps
sudo vim /etc/systemd/user/docker-kev-developer.service 
sudo shutdown -Ph now
sudo docker ps
sudo docker ps -a
sudo docker rm -f developer-1
sudo ./vm-prog/dockerfiles/developer/docker-run.sh 1 10022
sudo docker ps -a
sudo shutdown -Ph now
sudo docker -ps
sudo docker ps
sudo docker ps -1
sudo docker ps -a
cat /etc/systemd/user/docker-kev-developer.service 
vim /etc/systemd/user/docker-kev-developer.service 
sudo vim /etc/systemd/user/docker-kev-developer.service 
sudo serive start docker-kev-developer.service 
sudo serive start docker-kev-developer
sudo service docker-kev-developer start
sudo cp /etc/systemd/user/docker-kev-developer.service /etc/systemd/system/
sudo service docker-kev-developer start
sudo docker ps -a
sudo docker rm -f developer-1
sudo docker ps -a
sudo service docker-kev-developer start
sudo docker ps -a
sudo rm /etc/systemd/user/docker-kev-developer.service 
sudo shutdown -Ph now
sudo docker ps -a
cat /etc/systemd/system/docker-kev-developer.service 
sudo vim /etc/systemd/system/docker-kev-developer.service 
sudo shutdown -Ph now
cat /var/mail/kevin 
sudo docker ps -a
cat /etc/systemd/system/docker-kev-developer.service 
/usr/bin/docker stop -t 2 build/developer
/usr/bin/docker stop -t 2 developer-1
sudo /usr/bin/docker stop -t 2 developer-1
sudo /usr/bin/docker stop -t 2 build/developer
sudo vim /etc/systemd/system/docker-kev-developer.service 
sudo docker ps -a
sudo rm -f developer-1
sudo docker ps -a
sudo docker rm -f developer-1
sudo docker ps -a
sudo shutdown -Ph now
sudo docker ps -a
sudo vim /etc/systemd/system/docker-kev-developer.service 
sudo service docker-kev-developer start
sudo docker ps -a
ssh admin@localhost -p 10122
sudo vim /etc/systemd/system/docker-kev-developer.service 
sudo service docker-kev-developer start
sudo docker ps -a
sudo vim /etc/systemd/system/docker-kev-developer.service 
sudo service docker-kev-developer start
sudo docker ps -a
sudo systemctl daemon-reload
sudo service docker-kev-developer start
sudo docker ps -a
sudo service docker-kev-developer stop
sudo docker ps -a
sudo shutdown -Ph now
sudo docker ps -a
sudo service docker-kev-developer start
sudo docker ps -a
vim .bash_aliases
. .bash_aliases 
cdev
vim .bash_aliases 
. .bash_aliases 
cdev
echo $TMUX
cdev
vim .bash_aliases 
. .bash_aliases 
cdev
sudo vim /etc/ssh_config
vim ~/.ssh/ssh_config
vim ~/.ssh/config
echo $TMUX
cdev
sudo vim /etc/sshd_config
cdev
sudo vim /etc/ssh/sshd_config 
vim ./vm-prog/setup-vm/setup-lmde.sh 
cat ./vm-prog/setup-vm/setup-lmde.sh 
cat /etc/ssh/sshd_config | grep ^AcceptEnv
sed -i 's/^AcceptEnv.*/AcceptEnv LANG LC_\* TMUX/' /etc/ssh/sshd_config
sudo sed -i 's/^AcceptEnv.*/AcceptEnv LANG LC_\* TMUX/' /etc/ssh/sshd_config
cat /etc/ssh/sshd_config | grep ^AcceptEnv
sudo sed -i 's/^AcceptEnv.*/AcceptEnv LANG LC_\* TMUX MORE/' /etc/ssh/sshd_config
cat /etc/ssh/sshd_config | grep ^AcceptEnv
sudo sed -i 's/^AcceptEnv.*/AcceptEnv LANG LC_\* TMUX/' /etc/ssh/sshd_config
 /etc/ssh/sshd_config | grep ^AcceptEnv
echo "sed -i 's/^AcceptEnv.*/AcceptEnv LANG LC_\* TMUX/' /etc/ssh/sshd_config" >> ./vm-prog/dockerfiles/developer/docker-build.sh 
vim ./vm-prog/dockerfiles/developer/docker-build.sh 
echo "sed -i 's/^AcceptEnv.*/AcceptEnv LANG LC_\* TMUX/' /etc/ssh/sshd_config" >> ./vm-prog/dockerfiles/developer/Dockerfile 
vim ./vm-prog/dockerfiles/developer/Dockerfile 
exit
echo $TMUX
sudo service sshd restart
exit
echo $TMUX
cdev
cat ./vm-prog/dockerfiles/developer/Dockerfile 
sudo ./vm-prog/dockerfiles/developer/docker-build.sh 1 1
sudo cd ./vm-prog/dockerfiles/developer/; ./vm-prog/dockerfiles/developer/docker-build.sh 1 1
sudo cd ./vm-prog/dockerfiles/developer/
cd ./vm-prog/
cd dockerfiles/
cd developer/
ll
ls -al
sudo ./docker-build.sh 1 1
sudo ./docker-run.sh 1 10122
sudo ./docker-run.sh 2 10222
ssh -X admin@localhost -p 10222
cd ..
git add .
git commit -m "Changed to accept TMUX environment variable in ssh connections"
git config --global user.name "Kevin Johnston"
git config --global user.email "kevinjohnston512@gmail.com"
git commit -m "Changed to accept TMUX environment variable in ssh connections"
cd ../..
ls -al
cat .gitconfig 
sudo ./docker-run.sh 3 10322 -h developer
cd ./vm-prog/dockerfiles/developer/
sudo ./docker-run.sh 3 10322 -h developer
ssh admin@localhost -X -p 10322
sudo ./docker-run.sh 4 10422 --uts="developer"
ssh admin@localhost -X -p 10422
sudo service /docker-kev-developer.service stop
sudo rm /etc/systemd/system/docker-kev-developer.service 
cd ../misc/
ll
ls -al
sudo ./docker-stop.sh 1
sudo ./docker-purge.sh 1
sudo docker ps -a
sudo docker rm -f build/develioper
sudo docker rm -f build/developer
sudo docker rm -f developer-1
sudo docker ps -a
cd ../developer/
ls -al
vim ~/.bash_aliases 
. ~/.bash_aliases 
vim ~/.bash_aliases 
cdev
vim ~/.ssh/config 
vim ~/vm-prog/setup-vm/setup-lmde.sh 
cdev
cat ~/.bash_aliases 
vim ~/.bash_aliases 
cdev
. ~/.bash_aliases 
cdev
vim ~/.bash_aliases 
. ~/.bash_aliases 
cdev
ssh-keygen -t rsa -b 4096
cp ~/.ssh/config ~/.ssh/config.bak
vim ~/.ssh/config
cdev
vim ~/.bash_aliases 
cat ~/.bashrc 
less ~/.bashrc 
vim ~/.bashrc 
cat ~/.bash_aliases >> ~/.bashrc 
vim ~/.bashrc 
cat ./docker-run.sh 
vim ~/.bashrc 
cat ./docker-run.sh 
vim ~/.bashrc 
. ~/.bashrc 
vim ~/.bashrc 
. ~/.bashrc 
vim ~/.bashrc 
. ~/.bashrc 
cdev 2
cdev 5
alias cdev=""
. ~/.bashrc 
cdev 5
vim ~/.bashrc 
. ~/.bashrc 
cdev-test 5
exit
sudo shutdown -Ph now
cat ~/.bashrc 
echo $TMUX
cdev
cat ~/.ssh/known_hosts 
rm ~/.ssh/known_hosts 
cdev
scp ./.ssh/id_rsa.pub 192.168.122.225:~/authorized_keys
scp ./.ssh/id_rsa.pub admin@192.168.122.225:~/authorized_keys
cat .bashrc 
scp ./.ssh/id_rsa.pub admin@localhost:~/authorized_keys -p 10122
scp ./.ssh/id_rsa.pub admin@localhost:~/ -p 10122
ls -al ./.ssh/
scp ./.ssh/id_rsa.pub admin@localhost:~/id_rsa.pub -p 10122
scp ./.ssh/id_rsa.pub admin@localhost:~/id_rsa.pub -p10122
scp ./.ssh/id_rsa.pub admin@localhost:~/id_rsa.pub ip1
man scp
man scp | grep port
scp ./.ssh/id_rsa.pub admin@localhost:~/id_rsa.pub -P10122
scp ./.ssh/id_rsa.pub admin@localhost:~/id_rsa.pub -P 10122
scp -P 10122 ./.ssh/id_rsa.pub admin@localhost:~/id_rsa.pub
cdev
ssh admin@localhost ip 10122
ssh admin@localhost -p 10122
ssh admin@localhost -p 10122 -v
sudo docker ps -a
rm ~/.ssh/known_hosts 
sudo ./vm-prog/dockerfiles/misc/docker-stop.sh 1
sudo ./vm-prog/dockerfiles/misc/docker-purge.sh 1
cdev
sudo docker ps
ls -al
scp -P 10122 ./.ssh/id_rsa.pub admin@localhost:~/authorized_keys
cdev
vim ~/.ssh/config
cdev
vim ./vm-prog/dockerfiles/developer/Dockerfile 
sudo shutdown -Ph now
ls -al
stow
sudo apt-get install stow
vim ./vm-prog/setup-vm/setup-lmde.sh 
cd ..
cd kevin/
ll
ls -al
git
ll
ls -al ./.ssh/
git clone git@github.com/kevinjohnston/dotfiles.get
git clone git@github.com/kevinjohnston/dotfiles.git
git clone git@github.com:kevinjohnston/dotfiles.git
vim ./.ssh/id_rsa.pub 
git clone git@github.com:kevinjohnston/dotfiles.git
cat ./.ssh/id_rsa.pub 
git clone git@github.com:kevinjohnston/dotfiles.git
bg
jobs
ll
ls -al
cd dotfiles/
ls -al
git branch -a
git branch
cd ..
ls -al
jobs
mkdir tmp; cd tmp
git clone git@github.com:kevinjohnston/dotfiles.git
ls -al
cd dotfiles/
ll
vim .gitignore 
git rm --cached ./face/ -r
la ./gconf/.gconf/apps/
du -sh ./gconf/.gconf/apps/*
du -sh ./gconf/
la
la ..
du -sh ../.gconf/
vim ../vm-prog/setup-vm/setup-lmde.sh 
rm -r ../.gconf*
stow gconf
la ..
ls -al
la gitconfig/
cat gitconfig/.gitconfig 
stow gitconfig/
rm ../.gitconfig 
stow gitconfig/
vim ../vm-prog/setup-vm/setup-lmde.sh 
la
la ..
ls -al ../.gnupg/
du -sh ../.gnupg/
cat ../.gnupg/gpg.conf 
ls -al
vim .gitignore 
ls -al gksu.lock/.gksu.lock 
cat gksu.lock/.gksu.lock 
vim .gitignore 
git rm --cached ./gksu.lock/
git rm --cached ./gksu.lock/ -r
ls -al ../
ls -al ./gnome2/
la
la ..
la
du -sh ./kde/
find fde
find kde
vim .gitignore 
git rm --cached ./kde/.kde/tmp-wintermute 
git rm --cached ./kde/.kde/tmp-cache
git rm --cached ./kde/.kde/cache-wintermute
git rm --cached ./kde/.kde/socket-wintermute 
la
la ../.kde/
find ../.kde/
du -sh ../.kde/*
du -sh ../.kde/share/*
du -sh ../.kde/share/config/
find ../.kde/share/config/
mv ../.kde/ ./kde/
mv ../.kde/ ./kde/ -f
rsync -a ../.kde/ ./kde/
ls -al ../.kde/
ls -al ./kde/.kde/
du -sh ./kde/.kde/*
du -sh ~/.kde/
sudo cp -R ../.kde/ ./kde/
ls -al ./kde/
rm -rf ./kde/.kde/
