# dotfiles

My personal collection of dotfiles for macOS development setup.

## Requirements

- **macOS** – This setup is designed specifically for macOS
- [zsh](http://www.zsh.org/) – Unix shell (included with macOS)
- [git](https://git-scm.com/) – version control
- [Homebrew](https://brew.sh/) – package manager for macOS

## Installation

1. Clone the repo into your home directory:

   ```sh
   git clone git@github.com:vanbouzoukas/dotfiles.git ~/Developer/dotfiles
   ```

2. Install Homebrew if you haven't already:

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. Install all packages and applications from the Brewfile:

   ```sh
   cd ~/Developer/dotfiles
   brew bundle
   ```

4. Point to the relevant dotfiles in your local config.

   ### `.zshrc`

   Source your custom shell configuration:

   ```sh
   source ~/Developer/dotfiles/.zshrc
   ```

   ### `.gitconfig`

   Include your Git config and set your user identity:

   ```ini
   [include]
       path = ~/Developer/dotfiles/.gitconfig

   [user]
       name = Your Name
       email = your@email.com
   ```

## Maintenance

To keep your setup up to date:

```sh
# Update Homebrew packages
brewuc  # alias for: brew upgrade --greedy && brew cleanup --prune=all

# Update pnpm packages
pnu     # alias for: pnpm update:latest

# Reload shell configuration
reload  # alias for: source ~/.zshrc
```
