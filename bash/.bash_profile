##### Sourced for BASH login shells
# Should:
# source .profile the default, non-bash specific profile, as bash will not load it when this file is present

# Should not:
# be used to set variables useful only when interacting at the command line e.g. CLICOLOR



##### Only config X once
##################################################
if [ -z "$SET_XMODMAP2" ]; then
  xmodmap -e "remove Lock = Caps_Lock" 2>/dev/null
  xmodmap -e "keycode 9 = Escape" 2>/dev/null
  xmodmap -e "keycode 66 = Escape" 2>/dev/null
  xmodmap -e "keycode 78 = Caps_Lock" 2>/dev/null
  if [ -z "$SET_XMODMAP" ]; then
    export SET_XMODMAP2=1
  fi
  export SET_XMODMAP=1
fi



##### Indicate this file was sourced
##################################################
export SOURCED_DOT_BASH_PROFILE=1



##### Source other files
##################################################
[[ -s "$HOME/.profile" && -z ${SOURCED_DOT_PROFILE} ]] && source "$HOME/.profile" # Source the default .profile
source "$HOME/.bashrc" # for interactive shells, source .bashrc
