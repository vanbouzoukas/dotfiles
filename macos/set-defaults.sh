#!/usr/bin/env bash

osascript -e 'tell application "System Settings" to quit' 2>/dev/null

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "🍎 Setting macOS defaults..."

# === General UI/UX ===

# Expand save panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# === Finder ===

# Show status bar and path bar
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid .DS_Store on network/USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# === Dock ===

# Don't animate opening applications
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control
defaults write com.apple.dock expose-animation-duration -float 0.1

# === Apply changes ===

for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" &> /dev/null
done

echo "✅ Done. Some changes require logout/restart."