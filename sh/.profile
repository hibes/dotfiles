##### Sourced for ALL login shells
# Should:
# have content useful for GUI programs e.g. program specific environment variables
# configure variables used by all shells e.g. PATH environment variable

# Should not:
# use bash specific features e.g. umask or source
# contain configuration only necessasary for interactive cli programs e.g. the GIT_EDITOR environment variable used by git



##### Indicate this file was sourced
##################################################
export SOURCED_DOT_PROFILE=1



##### Setup basics
##################################################
if [ -f "/opt/scripts/setup/env.sh" ]; then
  . /opt/scripts/setup/env.sh
fi
export PATH="/opt/scripts:/opt/local/bin:/usr/local/bin:$PATH"



##### Setup basics
##################################################
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'



##### Setup rbenv
##################################################
# Use rbenv if existing
which rbenv
if [ $? -eq 0 ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Source RVM into a shell session *as a function*
fi



##### Setup boot
##################################################
export BOOT_JVM_OPTIONS=' -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xmx2g -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xverify:none'


##### Setup Android Dev related variables
##################################################
if [ -d "/usr/lib/android-sdk/" ]; then
  export ANDROID_SDK_ROOT=/usr/lib/android-sdk/
  export ANDROID_HOME=/usr/lib/android-sdk/ # note ANDROID_HOME is deprecated in favor of ANDROID_SDK_ROOT
  export PATH=$PATH:${ANDROID_SDK_ROOT}emulator/:$ANDROID_SDK_ROOT/android-sdk-tools/tools/bin/
  export LD_LIBRARY_PATH=${ANDROID_SDK_ROOT}emulator/lib64/qt/lib/:$LD_LIBRARY_PATH
  emulator () { cd "$(dirname "$(which emulator)")" && ./emulator "$@"; }
fi

##### Lein
#######################################################
export LEIN_ROOT=1 # disable warning when running lein commands as root



##### Alpha Centauri Quotes
##################################################
if [ -f "./.quotes" ]; then
  source ./.quotes
fi
