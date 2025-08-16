# ───── pnpm ─────

# Set pnpm home and add to PATH if not already present
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Use pnpm instead of npm/npx
alias npm=pnpm
alias npx="pnpm dlx"

# Short pnpm commands
alias pn="pnpm"
alias pnd="pnpm dev"
alias pnu="pnpm update --latest --interactive"


# ───── Homebrew ─────

# Upgrade all and clean
alias brewuc="brew upgrade --greedy && brew cleanup --prune=all"

# Upgrade only outdated packages
alias brewu="brew upgrade"

# Clean up old files
alias brewc="brew cleanup --prune=all"

# Show outdated packages
brewout() {
  echo "Outdated packages:"
  brew outdated
}


# ───── QoL (Quality of Life) ─────

# Reload shell config
alias reload="source ~/.zshrc"

# Jump to dev folder
alias dev="cd ~/Developer"


# ───── Functions ─────

# Make directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Open current directory in Finder
alias o="open ."


# ───── ls aliases ─────

# Long list, human-readable
alias ll="ls -alh"

# List all except . and ..
alias la="ls -A"

# Column view with file type indicators
alias l="ls -CF"