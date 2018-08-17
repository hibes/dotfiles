##### General commands
##################################################
alias mkdir="mkdir -p"
alias grep="grep --color=always"
alias datec="date +'%c'"
alias ec="emacsclient"
alias l="ls -lF"
alias la="ls -alF"
alias lr='ls -altrF'
alias vl="lock"
alias vless="vimpager"
alias vcat='vimcat'
alias readlink='greadlink'
alias mime="mimeopen"
alias op="mimeopen"



##### Tmux commands
##################################################
alias tmux="/usr/bin/tmux -2"


##### Trackpad commands
#######################################################
alias mdisable="xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"Device Enabled\" 0"
alias menable="xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"Device Enabled\" 1"

##### Android commands
#######################################################
alias emu="emulator -avd Test15 -gpu off"

##### Backup to windows
#######################################################
alias overseer="cp -R ~/programming/overseer/ /media/kevin/708C98448C98072E/Users/Kevin/Desktop/; sudo chown -R kevin:kevin /media/kevin/708C98448C98072E/Users/Kevin/Desktop/overseer/"

##### Docker commands
#######################################################
alias docker-clean-images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker-clean-ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
