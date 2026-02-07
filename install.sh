#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_DIR="${HOME}/.dotfiles"
WORK_MODE_MARKER="${STATE_DIR}/work_mode"

echo "🔧 Installing dotfiles..."

# === 1. Homebrew ===

if ! command -v brew &>/dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/usr/local/bin/brew" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# === 2. Stow ===

if ! command -v stow &>/dev/null; then
    echo "📦 Installing stow..."
    brew install stow
fi

# === 3. Brewfile ===

echo "📦 Installing packages from Brewfile..."
cd "$REPO_DIR/brew"

if [[ "${1:-}" == "--work" ]]; then
    mkdir -p "${STATE_DIR}"
    touch "${WORK_MODE_MARKER}"
    trap "rm -f ${WORK_MODE_MARKER}" EXIT
    echo "💼 Work mode: Skipping personal packages."
fi

brew bundle --file=Brewfile || echo "⚠️  Some packages may have failed."

# === 4. Stow dotfiles ===

echo "🔗 Linking dotfiles..."
stow -v --restow --target="$HOME" --dir="$REPO_DIR" zsh git starship

# === 5. macOS defaults ===

if [[ "$(uname)" == "Darwin" ]]; then
    echo "🍎 Setting macOS defaults..."
    if [ -f "$REPO_DIR/macos/set-defaults.sh" ]; then
        chmod +x "$REPO_DIR/macos/set-defaults.sh"
        "$REPO_DIR/macos/set-defaults.sh"
    fi
fi

echo "✅ Done! Restart your terminal."
