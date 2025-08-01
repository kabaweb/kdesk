#!/usr/bin/env bash

MODE=${MODE:=release}
$ANDROID_NDK_HOME/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-strip android/app/src/main/jniLibs/arm64-v8a/*
flutter build apk --flavor custom_name --target-platform android-arm64,android-arm --${MODE} --obfuscate --split-debug-info ./split-debug-info
flutter build apk --flavor custom_name --split-per-abi --target-platform android-arm64,android-arm --${MODE} --obfuscate --split-debug-info ./split-debug-info
flutter build appbundle --flavor custom_name --target-platform android-arm64,android-arm --${MODE} --obfuscate --split-debug-info ./split-debug-info
