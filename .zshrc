# ─── Bun ───────────────────────────────────────────────────────────────────────

# Set Bun home and add to PATH if not already present (official Bun docs) [web:7][page:0]
export BUN_INSTALL="$HOME/.bun"
case ":$PATH:" in
  *":$BUN_INSTALL/bin:"*) ;;
  *) export PATH="$BUN_INSTALL/bin:$PATH" ;;
esac

# Source Bun completions if available (prevents duplicates on upgrade) [web:11][web:29]
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Use bun instead of npm/npx (community migration pattern) [web:37][web:41]
alias npm=bun
alias npx="bunx"

# Short bun commands
alias b="bun"
alias bi="bun install"
alias ba="bun add"
alias bad="bun add -d"


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