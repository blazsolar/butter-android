#!/bin/bash
set -ev

if [ "$ANDROID_DEVICE" == "static" ]
then
  ./gradlew check-PdisablePreDex --stacktrace
elif [ "$ANDROID_DEVICE" == "google_apis" ]
then
  ./gradlew :mobile:connectedCheck -PdisablePreDex --stacktrace
elif [ "$ANDROID_DEVICE" == "android-tv" ]
then
  ./gradlew :tv:connectedCheck -PdisablePreDex --stacktrace
else
  exit 1
fi
