##### Sourced for interactive shells
# Should:
# setup content specifically for a user at the command line e.g. PS1 environment variable

# Should not:
# setup variables also useful for GUI programs e.g. PATH environment variable

##### Indicate this file was sourced
#######################################################
export SOURCED_DOT_BASHRC=1



##### Setup basics
#######################################################
# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -n "$SOURCED_DOT_PROFILE" ] && [ $SOURCED_DOT_PROFILE -ne 1 ]; then
  # setup env variables
  source /opt/scripts/setup/env.sh
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar 2>/dev/null # bash version used by mac doesn't support this variable

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi



##### Setup history
#######################################################
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# timestamp history
export HISTTIMEFORMAT="%Y%m%d %H:%M:%S "



##### Setup bash completion
#######################################################
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
# load completions
[ -d ~/.bash_completion.d/ ] && for f in ~/.bash_completion.d/*; do . $f; done



##### Set PS1
#######################################################
# original PS1="\u@\H:\w\$ "
FORMAT_RESET='\[\e[0m\]'
FORMAT_BLACK='\[\e[1;30m\]'
FORMAT_BLUE='\[\e[1;34m\]'
FORMAT_GREEN='\[\e[1;32m\]'
FORMAT_PINK='\[\e[1;35m\]'
FORMAT_RED='\[\e[1;31m\]'
FORMAT_TEAL='\[\e[1;36m\]'
FORMAT_WHITE='\[\e[1;37m\]'
FORMAT_YELLOW='\[\e[1;33m\]'

PS_TIME="${FORMAT_BLUE}[\@]${FORMAT_RESET} "
if [ "$(whoami)" == "root" ]; then
  PS_USER="${FORMAT_RED}\u${FORMAT_RESET}"
else
  PS_USER="${FORMAT_GREEN}\u${FORMAT_RESET}"
fi
PS_HOST="${FORMAT_GREEN}@\H:${FORMAT_RESET}"
PS_PATH="${FORMAT_BLUE}\w/ ${FORMAT_RESET}"
PS_PROMPT="\\$ "
export PS1="${PS_TIME}${PS_USER}${PS_HOST}${PS_PATH}${PS_PROMPT}"




##### Set colors for ls
#######################################################
if [ "$OS" == 'mac' ]; then
  # mac style lscolors
  # original export LSCOLORS=ExFxCxDxBxegedabagacad
  export LSCOLORS=ExGxFxDxCxegedabagacad
  export CLICOLOR=1
  
else
  # di = directory
  # fi = file
  # ln = symbolic link
  # pi = fifo file
  # so = socket file
  # bd = block (buffered) special file
  # cd = character (unbuffered) special file
  # or = symbolic link pointing to a non-existent file (orphan)
  # mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
  # ex = file which is executable (ie. has 'x' set in permissions).

  # 0   = default colour
  # 1   = bold
  # 4   = underlined
  # 5   = flashing text
  # 7   = reverse field
  # 31  = red
  # 32  = green
  # 33  = orange
  # 34  = blue
  # 35  = purple
  # 36  = cyan
  # 37  = grey
  # 40  = black background
  # 41  = red background
  # 42  = green background
  # 43  = orange background
  # 44  = blue background
  # 45  = purple background
  # 46  = cyan background
  # 47  = grey background
  # 90  = dark grey
  # 91  = light red
  # 92  = light green
  # 93  = yellow
  # 94  = light blue
  # 95  = light purple
  # 96  = turquoise
  # 100 = dark grey background
  # 101 = light red background
  # 102 = light green background
  # 103 = yellow background
  # 104 = light blue background
  # 105 = light purple background
  # 106 = turquoise background
  export LS_COLORS='di=1;34:ln=1;36:so=1;35:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
  alias ls="ls --color"
fi



##### Setup git
#######################################################
export GIT_EDITOR=vim



##### Setup TERM
#######################################################
# set variables
TERM=xterm # default term value
TERMS=('xterm-256color-italic' 'xterm-256color' 'xterm') # term order of preference
TERM_DIRS=() # possible compiled term locations
if [ -d "${HOME}/.terminfo/" ]; then TERM_DIRS+=("${HOME}/.terminfo/"); fi
if [ -d "/usr/share/terminfo/" ]; then TERM_DIRS+=("/usr/share/terminfo/"); fi

for term in $TERMS; do
  
  for dir in $TERM_DIRS; do
    # try to find already compiled term
    grep -Ri $term $dir >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      export TERM=$term
      break 2;
    fi
  done

  # try to find uncompiled term info
  if [ -f "${HOME}/.${term}.terminfo" ]; then

    # compile it
    tic "${HOME}/.${term}.terminfo"

    # use it
    export TERM=$term
    break;
    
  fi
done
# cleanup
export TERM
unset TERMS
unset TERM_DIRS



##### Use git radar if available
#######################################################
# use git radar if available, and in linux -- runs too slow in cygwin and mac to be useful
if [ -d /opt/local/.git-radar ] && [ "$OS" == 'nix' ]; then 
  export PS1='$PS1$(if [[ -n $(git-radar --bash) ]]; then echo "$(git-radar --bash): "|cut -c2-; fi)'
fi




##### Source other files
#######################################################
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

shopt -q login_shell || su - $(whoami) # if not a login shell, prompt for login
