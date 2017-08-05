#!/bin/bash
set -ev

# Delete old SDK
rm -rf $ANDROID_HOME/*

# Download and extract tools
wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
unzip -o sdk-tools-linux-3859397.zip -d $ANDROID_HOME/

# Apply licenses
cp -r config/ci/licenses $ANDROID_HOME/

# Install SDK components
$ANDROID_HOME/tools/bin/sdkmanager "tools" --channel=3
$ANDROID_HOME/tools/bin/sdkmanager "build-tools;26.0.1" --channel=3
$ANDROID_HOME/tools/bin/sdkmanager "emulator" --channel=3
$ANDROID_HOME/tools/bin/sdkmanager "platform-tools" --channel=3
$ANDROID_HOME/tools/bin/sdkmanager "platforms;android-25" --channel=3
$ANDROID_HOME/tools/bin/sdkmanager "extras;google;m2repository" --channel=3

if [ "$ANDROID_DEVICE" -ne "static" ]
then
  $ANDROID_HOME/tools/bin/sdkmanager "system-images;$ANDROID_TARGET;$ANDROID_DEVICE;$ANDROID_ABI" --channel=3
fi
