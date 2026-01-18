#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${HOME}/Developer/dotfiles"
STATE_DIR="${HOME}/.dotfiles"
BACKUP_DIR="${STATE_DIR}/backups/$(date +%Y%m%d_%H%M%S)"
WORK_MODE_MARKER="${STATE_DIR}/work_mode"

echo "🔧 Installing dotfiles..."

# 1. Check for Homebrew
if ! command -v brew &>/dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for the current session
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/usr/local/bin/brew" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# 2. Install stow if not present
if ! command -v stow &>/dev/null; then
    echo "📦 Installing Stow..."
    brew install stow
fi

# 3. Install packages from Brewfile
echo "📦 Installing packages from Brewfile..."
cd "$REPO_DIR/brew"

# Check for --work flag (creates a temporary marker file for Brewfile)
if [[ "${1:-}" == "--work" ]]; then
    mkdir -p "${STATE_DIR}"
    touch "${WORK_MODE_MARKER}"
    # Ensure the marker is deleted when the script exits
    trap "rm -f ${WORK_MODE_MARKER}" EXIT
    echo "💼 Work mode active: Skipping personal packages."
fi

brew bundle --file=Brewfile || echo "⚠️  Some brew packages might have failed to install."

# 4. Backup existing dotfiles before stowing
echo "💾 Backing up existing configurations..."
mkdir -p "$BACKUP_DIR"
for file in ".zshrc" ".gitconfig" ".gitignore_global"; do
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        echo "   Moving $file to $BACKUP_DIR"
        mv "$HOME/$file" "$BACKUP_DIR/"
    fi
done

# 5. Stow dotfiles
echo "🔗 Linking dotfiles..."
stow -v --restow --target="$HOME" --dir="$REPO_DIR" zsh git starship

echo "✅ Done! Restart your terminal."