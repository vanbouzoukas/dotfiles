#!/usr/bin/env bash

osascript -e 'tell application "System Settings" to quit' 2>/dev/null

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "🧹 Resetting macOS defaults..."

# === General UI/UX ===

defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode 2>/dev/null
defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 2>/dev/null
defaults delete NSGlobalDomain NSAutomaticSpellingCorrectionEnabled 2>/dev/null

# === Finder ===

defaults delete com.apple.finder ShowStatusBar 2>/dev/null
defaults delete com.apple.finder ShowPathbar 2>/dev/null
defaults delete com.apple.finder _FXSortFoldersFirst 2>/dev/null
defaults delete com.apple.finder FXDefaultSearchScope 2>/dev/null
defaults delete com.apple.finder FXEnableExtensionChangeWarning 2>/dev/null
defaults delete com.apple.desktopservices DSDontWriteNetworkStores 2>/dev/null
defaults delete com.apple.desktopservices DSDontWriteUSBStores 2>/dev/null

# === Dock ===

defaults delete com.apple.dock launchanim 2>/dev/null
defaults delete com.apple.dock expose-animation-duration 2>/dev/null

# === Apply changes ===

for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" &> /dev/null
done

echo "✅ Done. Restart your computer to fully restore defaults."