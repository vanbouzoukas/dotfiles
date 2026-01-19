#!/usr/bin/env bash

# Close any open System Preferences panes
osascript -e 'tell application "System Preferences" to quit'

echo "🧹 Resetting macOS defaults..."

# General UI/UX
defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode
defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode2
defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint
defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint2
defaults delete com.apple.print.PrintingPrefs "Quit When Finished"

# Inputs (Trackpad, Mouse, Keyboard)
defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking
defaults -currentHost delete NSGlobalDomain com.apple.mouse.tapBehavior
defaults delete NSGlobalDomain com.apple.mouse.tapBehavior

defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag
defaults delete com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag

# Finder
defaults delete com.apple.finder QuitMenuItem
defaults delete com.apple.finder ShowStatusBar
defaults delete com.apple.finder ShowPathbar
defaults delete com.apple.finder _FXSortFoldersFirst
defaults delete com.apple.finder FXDefaultSearchScope
defaults delete com.apple.finder FXEnableExtensionChangeWarning
defaults delete com.apple.desktopservices DSDontWriteNetworkStores
defaults delete com.apple.desktopservices DSDontWriteUSBStores

# Safari
defaults delete com.apple.Safari ShowFullURLInSmartSearchField
defaults delete com.apple.Safari IncludeDevelopMenu
defaults delete com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey
defaults delete com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled
defaults delete com.apple.Safari ReadingListSaveArticlesOffline

# Dock
defaults delete com.apple.dock autohide
defaults delete com.apple.dock autohide-delay
defaults delete com.apple.dock autohide-time-modifier
defaults delete com.apple.dock launchanim
defaults delete com.apple.dock expose-animation-duration

# Wallpaper
defaults -currentHost delete com.apple.screensaver idleTime

# Apply Changes
for app in "Dock" "Finder" "SystemUIServer"; do
	killall "${app}" &> /dev/null
done

echo "Done. Please restart your computer to ensure all defaults are fully restored."
