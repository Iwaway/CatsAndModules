# For your convenience
alias PlistBuddy=/usr/libexec/PlistBuddy

# Read script input parameter and add it to your Info.plist. Values can either be CATS or DOGS
app_type=$1

if [ "$app_type" == "CATS" ]; then
    PlistBuddy -c "Set :type CATS" CatsAndModules/Info.plist
elif [ "$app_type" == "DOGS" ]; then
    PlistBuddy -c "Set :type DOGS" CatsAndModules/Info.plist
else
    echo "Invalid argument! Please provide either CATS or DOGS."
    exit 1
fi

# Clean build folder
xcodebuild clean -project CatsAndModules_YehorBilokin.xcodeproj -scheme CatsAndModules -configuration Release

# Create archive
xcodebuild archive -allowProvisioningUpdates -scheme CatsAndModules -configuration Release -archivePath "build/CatsAndModules$app_type.xcarchive" GENERIC_PLATFORM='iOS'

# Export archive
xcodebuild -exportArchive -archivePath "build/CatsAndModules$app_type.xcarchive" -exportPath "Exported_$app_type" -exportOptionsPlist "exportOptions.plist"

