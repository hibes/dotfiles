#!/bin/bash

##### Constants
TOOLS_VERSION=3859397
DOWNLOAD_PATH=/tmp/
TOOLS_FILE_NAME=sdk-tools-linux-$TOOLS_VERSION
ANDROID_TOOLS_DIR=/tmp/android-sdk-tools/
export ANDROID_SDK_ROOT=/usr/lib/android-sdk/
export ANDROID_HOME=/usr/lib/android-sdk/ # note ANDROID_HOME is deprecated in favor of ANDROID_SDK_ROOT

# see https://developer.android.com/studio/command-line/variables.html for other env variables you may want to set

# install android sdk and platform
apt-get install -y android-tools-adb

# download android sdk tools
echo Downloading
wget -O $DOWNLOAD_PATH$TOOLS_FILE_NAME.zip -c https://dl.google.com/android/repository/sdk-tools-linux-$TOOLS_VERSION.zip
unzip -q $DOWNLOAD_PATH$TOOLS_FILE_NAME -d $ANDROID_HOME$ANDROID_TOOLS_DIR

# Download android studio ide zip
#wget -o /tmp/android-studio-ide https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip

/usr/bin/expect <<'YES'
set timeout 600
spawn sdkmanager "platform-tools" "platforms;android-26" "platforms;android-18" "platforms;android-15" "extras;android;m2repository" "build-tools;26.0.0" "build-tools;27.0.2" "system-images;android-15;google_apis;x86" "emulator"
expect "Accept? (y/N):" 
send "y\r"
expect "root@"
interact
YES


# add some ANDROID directories to path
# add emulator before other tools due to bug https://issuetracker.google.com/issues/37137213 -- see comment #25
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator/:$ANDROID_SDK_ROOT/android-sdk-tools/tools/bin/

# make emulator see qt libraries
export LD_LIBRARY_PATH=$ANDROID_SDK_ROOT/emulator/lib64/qt/lib/:$LD_LIBRARY_PATH

# get rid of no repositories.cfg warning
if [ "$USER" == "root" ]; then
  USER_HOME_DIR=/$USER/
else
  USER_HOME_DIR=/home/$USER/
fi
touch ${USER_HOME_DIR}.android/repositories.cfg


##### avd creation examples
#avdmanager create avd -d 3 -n Test15 -k 'system-images;android-15;google_apis;x86' -g google_apis
#avdmanager create avd --force --name Test23 --abi google_apis/x86_64 --package 'system-images;android-23;google_apis;x86_64'
##### emulator start examples
#emulator -avd Test15 -gpu off 
#emulator -avd Test23 -gpu off 
