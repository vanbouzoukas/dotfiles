#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "🧹 Resetting macOS defaults..."

# General UI/UX

# Expand save and print panels by default
defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode
defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode2
defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint
defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint2

# Quit printer app when finished
defaults delete com.apple.print.PrintingPrefs "Quit When Finished"

# Inputs (Trackpad, Mouse, Keyboard)

# Enable tap to click (for user and login screen)
defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking
defaults -currentHost delete NSGlobalDomain com.apple.mouse.tapBehavior
defaults delete NSGlobalDomain com.apple.mouse.tapBehavior

# Enable three-finger drag
defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag
defaults delete com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag

# Finder

# Allow quitting via ⌘ + Q
defaults delete com.apple.finder QuitMenuItem

# Show all filename extensions, status bar and path bar
defaults delete com.apple.finder ShowStatusBar
defaults delete com.apple.finder ShowPathbar

# Keep folders on top when sorting by name
defaults delete com.apple.finder _FXSortFoldersFirst

# Search the current folder by default
defaults delete com.apple.finder FXDefaultSearchScope

# Disable the warning when changing a file extension
defaults delete com.apple.finder FXEnableExtensionChangeWarning

# Avoid creating .DS_Store files on network or USB volumes
defaults delete com.apple.desktopservices DSDontWriteNetworkStores
defaults delete com.apple.desktopservices DSDontWriteUSBStores

# Safari

# Show full website address
defaults delete com.apple.Safari ShowFullURLInSmartSearchField

# Enable the Develop menu and the Web Inspector
defaults delete com.apple.Safari IncludeDevelopMenu
defaults delete com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey
defaults delete com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled

# Save articles for offline reading automatically
defaults delete com.apple.Safari ReadingListSaveArticlesOffline

# Dock

# Automatically hide and show the Dock
defaults delete com.apple.dock autohide

# Remove the auto-hiding Dock delay and animation
defaults delete com.apple.dock autohide-delay
defaults delete com.apple.dock autohide-time-modifier

# Don't animate opening applications
defaults delete com.apple.dock launchanim

# Speed up Mission Control animations
defaults delete com.apple.dock expose-animation-duration

# Wallpaper

# Start screen saver after 5 minutes of inactivity
defaults -currentHost delete com.apple.screensaver idleTime

# Apply Changes
for app in "Dock" "Finder" "SystemUIServer"; do
	killall "${app}" &> /dev/null
done

echo "Done. Please restart your computer to ensure all defaults are fully restored."
