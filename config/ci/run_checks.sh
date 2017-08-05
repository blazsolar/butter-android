#!/bin/bash
set -ev

if [ "$ANDROID_DEVICE" -eq "static" ]
then
  ./gradlew check-PdisablePreDex --stacktrace
elif [ "$ANDROID_DEVICE" -eq "google_apis" ]
then
  ./gradlew :mobile:connectedCheck -PdisablePreDex --stacktrace
elif [ "$ANDROID_DEVICE" -eq "android-tv" ]
then
  ./gradlew :tv:connectedCheck -PdisablePreDex --stacktrace
else
  exit 1
fi
