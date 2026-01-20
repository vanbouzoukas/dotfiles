# Bun
export BUN_INSTALL="${HOME}/.bun"
[[ -d "$BUN_INSTALL/bin" ]] && path=("$BUN_INSTALL/bin" $path)

# Bun aliases
alias npm="bun"
alias npx="bunx"
alias yarn="bun"
alias b="bun"
alias bi="bun install"
alias ba="bun add"
alias bad="bun add -d"
alias br="bun run"
alias bt="bun test"
alias bx="bunx"
alias bu="bun update --latest"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
[[ -d "$PNPM_HOME" ]] && path=("$PNPM_HOME" $path)

# pnpm aliases
alias pn="pnpm"
alias pni="pnpm install"
alias pna="pnpm add"
alias pnad="pnpm add -D"
alias pnr="pnpm run"
alias pnx="pnpm dlx"
alias pnu="pnpm update -r -i -L"

# Brew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

export HOMEBREW_NO_ANALYTICS=1

# Brew aliases
alias bru="brew upgrade --greedy && brew cleanup --prune=all"
alias bc="brew cleanup --prune=all"
alias bo="brew outdated"
alias bl="brew list"
alias bs="brew search"
alias binfo="brew info"


# General aliases
alias c="clear"
alias reload="source ~/.zshrc" 
alias dev="cd ~/Developer"
alias o="open ."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../.."
alias ll="ls -alh"
alias la="ls -A"
alias l="ls -CF"

# macOS aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
    # System maintenance
    alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
    alias emptytrash="sudo rm -rf ~/.Trash/*"
    alias lock="pmset displaysleepnow"
    alias update="sudo softwareupdate -i -a"
    
    # Finder visibility
    alias showfiles="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
    alias hidefiles="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"
fi

# Remove duplicate PATH entries
typeset -U path PATH

# Starship prompt
eval "$(starship init zsh)"