#!/bin/bash

xcodebuild -verbose -scheme "PebbleBitcode" archive -archivePath "build/PebbleBitcode" -configuration "Release"
xcodebuild -exportArchive -archivePath "build/PebbleBitcode.xcarchive" -exportPath "build/PebbleBitcode.ipa" -exportOptionsPlist "options.plist"
