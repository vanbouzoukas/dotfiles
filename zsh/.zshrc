# === PATH setup ===

# Bun
export BUN_INSTALL="${HOME}/.bun"
[[ -d "$BUN_INSTALL/bin" ]] && path=("$BUN_INSTALL/bin" $path)

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
[[ -d "$PNPM_HOME" ]] && path=("$PNPM_HOME" $path)

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi
export HOMEBREW_NO_ANALYTICS=1

# Dedupe PATH entries
typeset -U path PATH

# === Bun aliases ===

alias bn="bun"
alias bni="bun install"
alias bna="bun add"
alias bnad="bun add -d"
alias bnr="bun run"
alias bnt="bun test"
alias bnx="bunx"
alias bnu="bun update --latest"

# === pnpm aliases ===

alias pn="pnpm"
alias pni="pnpm install"
alias pna="pnpm add"
alias pnad="pnpm add -D"
alias pnr="pnpm run"
alias pnx="pnpm dlx"
alias pnu="pnpm update -r -i -L"

# === Brew aliases ===

alias br="brew"
alias bru="brew upgrade --greedy && brew cleanup --prune=all"
alias brc="brew cleanup --prune=all"
alias bri="brew info"

# === General aliases ===

alias c="clear"
alias reload="source ~/.zshrc"
alias dev="cd ~/Developer"
alias o="open ."
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -alh"
alias la="ls -A"

# === Prompt ===

eval "$(starship init zsh)"