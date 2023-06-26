#!/bin/sh

xcodebuild clean -project CatsAndModules_YehorBilokin.xcodeproj -scheme CatsAndModules -configuration Release

xcodebuild archive -allowProvisioningUpdates -scheme CatsAndModules -configuration Release -archivePath "build/CatsAndModules.xcarchive" GENERIC_PLATFORM='iOS'

xcodebuild -exportArchive -archivePath "build/CatsAndModules.xcarchive" -exportPath "Exported" -exportOptionsPlist "exportOptions.plist"
