##### General commands
##################################################
alias mkdir="mkdir -p"
alias grep="grep --color=always"
alias date="date +'%c'"
alias ec="emacsclient"
alias l="ls -lF"
alias la="ls -alF"
alias lr='ls -altrF'
alias vl="lock"
alias vless="vimpager"
alias vcat='vimcat'
alias readlink='greadlink'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"' # Add an "alert" alias for long running commands.  e.g. sleep 10; alert




##### Tmux commands
##################################################
alias tmux="tmux -2"


##### Trackpad commands
#######################################################
alias mdisable="xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"Device Enabled\" 0"
alias menable="xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"Device Enabled\" 1"

