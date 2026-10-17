# === PATH ===

# Commands from global bun and pnpm packages
export PNPM_HOME="$HOME/Library/pnpm"
path=("$HOME/.bun/bin" "$PNPM_HOME/bin" $path)

# Commands from apps, such as VS Code's `code`
path=("/opt/homebrew/bin" $path)

# mise
path=("$HOME/.local/bin" $path)
eval "$(mise activate zsh)"

typeset -U path PATH # remove duplicates

# === Environment ===

export NEXT_TELEMETRY_DISABLED=1

# === Aliases ===

alias bn="bun"
alias bni="bun install"
alias bnu="bun update --recursive --interactive --latest"

alias ms="mise bootstrap status"
alias mu="mise run update"

alias pnc="pnpm clean"
alias pni="pnpm install"
alias pnu="pnpm update --recursive --interactive --latest --include-github-actions"

alias c="clear"
alias dev="cd ~/Developer"

# === Prompt ===

eval "$(starship init zsh)"
