#!/bin/bash
set -ev

if [ "$ANDROID_DEVICE" != "static" ]
then
  echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -f -n emulator -k "system-images;$ANDROID_TARGET;$$ANDROID_DEVICE;$ANDROID_ABI"
  $ANDROID_HOME/emulator/emulator -avd emulator -no-window -no-audio -wipe-data -no-boot-anim &
  android-wait-for-emulator
  adb devices
  adb shell input keyevent 82 &
fi
