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
alias pni="pnpm install"

# Run pnpm dev if defined, else show warning
pnd() {
  if grep -q '"dev":' package.json 2>/dev/null; then
    pnpm dev
  else
    echo "⚠️  'dev' script not found in package.json"
  fi
}

# Run pnpm start if defined, else show warning
pns() {
  if grep -q '"start":' package.json 2>/dev/null; then
    pnpm start
  else
    echo "⚠️  'start' script not found in package.json"
  fi
}

# Run pnpm clean if defined, else show warning
pnc() {
  if grep -q '"clean":' package.json 2>/dev/null; then
    pnpm clean
  else
    echo "⚠️  'clean' script not found in package.json"
  fi
}

# Run custom update:latest script if defined, else fallback to pnpm update --latest
pnu() {
  if grep -q '"update:latest":' package.json 2>/dev/null; then
    pnpm update:latest
  else
    pnpm update --latest --interactive
  fi
}


# ───── Homebrew ─────

# Upgrade all and clean
alias bru="brew upgrade --greedy && brew cleanup --prune=all"

# Upgrade only
alias bu="brew upgrade"

# Clean only
alias bc="brew cleanup --prune=all"

# Show outdated packages
alias bo="brew outdated"


# ───── QoL (Quality of Life) ─────

# Clear terminal
alias cl="clear"

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