# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi



# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -lF'
#alias la='ls -A'
#alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#load completions
for f in ~/.bash_completion.d/*; do . $f; done

#### BASH FUNCTIONS
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

############################# CYGWIN FIX ##############################
uname="$(uname -a)"
if ! [ "${uname/CYGWIN}" = "$(uname -a)" ] ; then
    export CYGWIN="winsymlinks:native"
fi

#### Call login scripts ###
. /opt/scripts/acd_func # use great cd script
cat /home/kevin/.TODO

#####Stay in a tmux session if at all possible
if [ -n "$(which tmux 2>/dev/null)" ] && [ container != "ConEmu" ]
then
    # start a new session if not already in one
    test -z ${TMUX} && tmux > /dev/null 2>&1
fi

### ADD OPT PROGRAMS TO PATH
pathadd /opt/bin/ #create symlinks to other opt executables here
pathadd /opt/scripts/ # put generic one-off scripts here, add everything to the path
pathadd /sbin/

#function cdev-test {
#  NUM="${1:-1}"
#  sudo ~/vm-prog/dockerfiles/developer/docker-run.sh $NUM 10$NUM22
#  ssh admin@localhost -X -p10$NUM22
#}

set -o ignoreeof #Remove the "ctrl-d exits terminal" feature
stty -ixon #Remove the "ctrl-s causes halt" feature(!?)

#Use git radar if available, and not in cygwin
if [ -d /opt/git-radar ] && [ -z "$CYGWIN" ]; then #runs far to slow in cygwin to be useful
  export PS1=$PS1'$(if [[ -n $(git-radar --bash) ]]; then echo "$(git-radar --bash): "|cut -c2-; fi)'
fi

#force 256 colors, note this is a bad idea
export TERM=xterm-256color
export EDITOR=ec
