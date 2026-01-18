# dotfiles

My personal macOS development setup. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Getting started

1. **Clone the repo:**

   ```sh
   git clone https://github.com/vanbouzoukas/dotfiles.git ~/Developer/dotfiles
   cd ~/Developer/dotfiles
   ```

2. **Run the installer:**

   ```sh
   chmod +x install.sh
   ./install.sh
   ```

   *Installs Homebrew, packages, and symlinks configs.*

   > **Note:** For work machines, run `./install.sh --work` to skip personal apps (games, media servers, etc).

3. **Configure Git identity:**

   Create `~/.gitconfig.local` to set your name and email (this file is ignored by git):

   ```sh
   echo "[user]
       name = YOUR NAME
       email = YOUR EMAIL" > ~/.gitconfig.local
   ```

## What's included

- **Shell:** Zsh + Starship prompt.
- **Tools:** Homebrew, Bun, Stow.
- **Apps:** Managed via Brewfile.
- **Git:** Best-practice config & aliases.

## Maintenance

```sh
# Update Homebrew packages
bru     # alias for: brew upgrade --greedy && brew cleanup --prune=all

# Update pnpm/bun packages
bi      # bun install
pni     # pnpm install

# Reload shell configuration
reload  # alias for: source ~/.zshrc
```

## Structure

- `zsh/` → Shell configuration
- `git/` → Git configuration
- `starship/` → Prompt configuration
- `install.sh` → Bootstrap script
- `Brewfile` → Packages & Apps

