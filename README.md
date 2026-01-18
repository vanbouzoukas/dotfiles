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

## Structure

* **`brew/`** — Homebrew apps and packages (Brewfile).
* **`git/`** — Git configuration and global ignore rules.
* **`macos/`** — Scripts for system preferences.
* **`starship/`** — Shell prompt options.
* **`zsh/`** — Shell configuration and aliases.

## macOS settings

The installer automatically applies sensible defaults (fast key repeat, tap-to-click, cleaner Dock, etc). You can also run these scripts manually:

```sh
# Apply settings
chmod +x macos/set-defaults.sh
./macos/set-defaults.sh

# Reset to factory defaults
chmod +x macos/reset-defaults.sh
./macos/reset-defaults.sh
```

## Useful aliases

```sh
# Maintenance
bru     # brew upgrade --greedy && brew cleanup --prune=all
reload  # source ~/.zshrc
```

