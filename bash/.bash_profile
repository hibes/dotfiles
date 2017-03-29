##### Sourced for BASH login shells
# Should:
# source .profile the default, non-bash specific profile, as bash will not load it when this file is present

# Should not:
# be used to set variables useful only when interacting at the command line e.g. CLICOLOR



##### Indicate this file was sourced
##################################################
export SOURCED_DOT_BASH_PROFILE=1



##### Source other files
##################################################
[[ -s "$HOME/.profile" && -z ${SOURCED_DOT_PROFILE} ]] && source "$HOME/.profile" # Source the default .profile
[[ -z ${SOURCED_DOT_BASHRC} ]] && source "$HOME/.bashrc" # for interactive shells, source .bashrc
